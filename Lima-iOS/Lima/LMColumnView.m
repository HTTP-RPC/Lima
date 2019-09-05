//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "LMColumnView.h"
#import "LMRowView.h"
#import "UIKit+Lima.h"

@implementation LMColumnView

- (void)setVerticalAlignment:(LMVerticalAlignment)verticalAlignment {
    if (verticalAlignment == LMVerticalAlignmentCenter) {
        [NSException raise:NSInvalidArgumentException format:@"Invalid vertical alignment."];
    }

    [super setVerticalAlignment:verticalAlignment];
}

- (void)setAlignToGrid:(BOOL)alignToGrid {
    _alignToGrid = alignToGrid;

    [self setNeedsUpdateConstraints];
}

- (void)layoutSubviews {
    LMHorizontalAlignment horizontalAlignment = [self horizontalAlignment];

    for (UIView * subview in [self subviews]) {
        if (![subview displayable]) {
            continue;
        }

        if (horizontalAlignment == LMHorizontalAlignmentFill) {
            [subview setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
            [subview setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        } else {
            [subview setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
            [subview setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        }

        if (isnan([subview weight])) {
            [subview setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
            [subview setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
        } else {
            [subview setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
            [subview setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
        }
    }

    [super layoutSubviews];
}

- (NSArray *)createConstraints {
    NSMutableArray *constraints = [NSMutableArray new];

    LMHorizontalAlignment horizontalAlignment = [self horizontalAlignment];
    LMVerticalAlignment verticalAlignment = [self verticalAlignment];

    CGFloat spacing = [self spacing];

    BOOL alignToBaseline = [self alignToBaseline];

    UIView *previousSubview = nil;
    UIView *previousWeightedSubview = nil;

    LMRowView *previousRowView = nil;

    for (UIView *subview in [self subviews]) {
        if (![subview displayable]) {
            continue;
        }

        // Align to siblings
        if (previousSubview == nil) {
            if (verticalAlignment != LMVerticalAlignmentBottom) {
                [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeTop
                    relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTopMargin
                    multiplier:1 constant:0]];
            }
        } else {
            if (alignToBaseline) {
                if (isnan(spacing)) {
                    [constraints addObject:[[subview firstBaselineAnchor] constraintEqualToSystemSpacingBelowAnchor:[previousSubview lastBaselineAnchor] multiplier:1]];
                } else {
                    [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeFirstBaseline
                        relatedBy:NSLayoutRelationEqual toItem:previousSubview attribute:NSLayoutAttributeLastBaseline
                        multiplier:1 constant:0]];
                }
            } else {
                if (isnan(spacing)) {
                    NSLayoutConstraint *constraint = [[subview topAnchor] constraintEqualToSystemSpacingBelowAnchor:[previousSubview bottomAnchor] multiplier:1];

                    [constraint setConstant:[constraint constant]];

                    [constraints addObject:constraint];
                } else {
                    [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeTop
                        relatedBy:NSLayoutRelationEqual toItem:previousSubview attribute:NSLayoutAttributeBottom
                        multiplier:1 constant:spacing]];
                }
            }
        }

        CGFloat weight = [subview weight];

        if (!isnan(weight) && isnan([subview height])) {
            if (previousWeightedSubview != nil) {
                [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeHeight
                    relatedBy:NSLayoutRelationEqual toItem:previousWeightedSubview attribute:NSLayoutAttributeHeight
                    multiplier:weight / [previousWeightedSubview weight] constant:0]];
            }

            previousWeightedSubview = subview;
        }

        // Align to parent
        switch (horizontalAlignment) {
            case LMHorizontalAlignmentFill: {
                [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeLeading
                    relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeadingMargin
                    multiplier:1 constant:0]];
                [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeTrailing
                    relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailingMargin
                    multiplier:1 constant:0]];

                break;
            }

            case LMHorizontalAlignmentLeading: {
                [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeLeading
                    relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeadingMargin
                    multiplier:1 constant:0]];

                break;
            }

            case LMHorizontalAlignmentTrailing: {
                [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeTrailing
                    relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailingMargin
                    multiplier:1 constant:0]];

                break;
            }

            case LMHorizontalAlignmentCenter: {
                [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeCenterX
                    relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX
                    multiplier:1 constant:0]];

                break;
            }
        }

        // Align subviews
        if (_alignToGrid && [subview isKindOfClass:[LMRowView self]]) {
            if (previousRowView != nil) {
                NSArray *cellViews = [subview subviews];
                NSArray *previousCellViews = [previousRowView subviews];

                for (NSUInteger i = 0, n = MIN([cellViews count], [previousCellViews count]); i < n; i++) {
                    UIView *cellView = [cellViews objectAtIndex:i];
                    UIView *previousCellView = [previousCellViews objectAtIndex:i];

                    [constraints addObject:[NSLayoutConstraint constraintWithItem:cellView attribute:NSLayoutAttributeWidth
                        relatedBy:NSLayoutRelationEqual toItem:previousCellView attribute:NSLayoutAttributeWidth
                        multiplier:1 constant:0]];
                }
            }

            previousRowView = (LMRowView *)subview;
        }

        previousSubview = subview;
    }

    // Align final view to bottom edge
    if (previousSubview != nil && verticalAlignment != LMVerticalAlignmentTop) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:previousSubview attribute:NSLayoutAttributeBottom
            relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottomMargin
            multiplier:1 constant:0]];
    }

    return constraints;
}

- (CGSize)intrinsicContentSize {
    for (UIView *subview in [self subviews]) {
        if ([subview displayable]) {
            return [super intrinsicContentSize];
        }
    }

    return CGSizeMake(UIViewNoIntrinsicMetric, 0);
}

@end
