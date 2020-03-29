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

#import "LMRowView.h"
#import "LMColumnView.h"
#import "UIKit+Lima.h"

@implementation LMRowView

- (void)setHorizontalAlignment:(LMHorizontalAlignment)horizontalAlignment {
    if (horizontalAlignment == LMHorizontalAlignmentCenter) {
        [NSException raise:NSInvalidArgumentException format:@"Invalid horizontal alignment."];
    }

    [super setHorizontalAlignment:horizontalAlignment];
}

- (void)setBaseline:(LMBaseline)baseline {
    _baseline = baseline;

    [self setNeedsUpdateConstraints];
}

- (void)layoutSubviews {
    LMVerticalAlignment verticalAlignment = [self verticalAlignment];

    for (UIView * subview in [self subviews]) {
        if (![subview displayable]) {
            continue;
        }

        if (verticalAlignment == LMVerticalAlignmentFill) {
            [subview setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical];
            [subview setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
        } else {
            [subview setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
            [subview setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        }

        if (isnan([subview weight])) {
            [subview setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
            [subview setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        } else {
            [subview setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
            [subview setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
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

    for (UIView *subview in [self subviews]) {
        if (![subview displayable]) {
            continue;
        }

        // Align to siblings
        if (previousSubview == nil) {
            if (horizontalAlignment != LMHorizontalAlignmentTrailing) {
                [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeLeading
                    relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeadingMargin
                    multiplier:1 constant:0]];
            }
        } else {
            if (isnan(spacing)) {
                NSLayoutConstraint *constraint = [[subview leadingAnchor] constraintEqualToSystemSpacingAfterAnchor:[previousSubview trailingAnchor] multiplier:1];

                [constraint setConstant:[constraint constant]];

                [constraints addObject:constraint];
            } else {
                [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeLeading
                    relatedBy:NSLayoutRelationEqual toItem:previousSubview attribute:NSLayoutAttributeTrailing
                    multiplier:1 constant:spacing]];
            }

            if (alignToBaseline) {
                NSLayoutAttribute baselineAttribute;
                switch (_baseline) {
                    case LMBaselineFirst: {
                        baselineAttribute = NSLayoutAttributeFirstBaseline;
                        break;
                    }

                    case LMBaselineLast: {
                        baselineAttribute = NSLayoutAttributeLastBaseline;
                        break;
                    }
                }

                [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:baselineAttribute
                    relatedBy:NSLayoutRelationEqual toItem:previousSubview attribute:baselineAttribute
                    multiplier:1 constant:0]];
            }
        }

        CGFloat weight = [subview weight];

        if (!isnan(weight) && isnan([subview width])) {
            if (previousWeightedSubview != nil) {
                [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeWidth
                    relatedBy:NSLayoutRelationEqual toItem:previousWeightedSubview attribute:NSLayoutAttributeWidth
                    multiplier:weight / [previousWeightedSubview weight] constant:0]];
            }

            previousWeightedSubview = subview;
        }

        // Align to parent
        switch (verticalAlignment) {
            case LMVerticalAlignmentFill: {
                if (alignToBaseline) {
                    [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeTop
                        relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self attribute:NSLayoutAttributeTopMargin
                        multiplier:1 constant:0]];

                    [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeBottom
                        relatedBy:NSLayoutRelationLessThanOrEqual toItem:self attribute:NSLayoutAttributeBottomMargin
                        multiplier:1 constant:0]];
                } else {
                    [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeTop
                        relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTopMargin
                        multiplier:1 constant:0]];

                    [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeBottom
                        relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottomMargin
                        multiplier:1 constant:0]];
                }

                break;
            }

            case LMVerticalAlignmentTop: {
                if (alignToBaseline) {
                    [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeTop
                        relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self attribute:NSLayoutAttributeTopMargin
                        multiplier:1 constant:0]];
                } else {
                    [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeTop
                        relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTopMargin
                        multiplier:1 constant:0]];
                }

                break;
            }

            case LMVerticalAlignmentBottom: {
                if (alignToBaseline) {
                    [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeBottom
                        relatedBy:NSLayoutRelationLessThanOrEqual toItem:self attribute:NSLayoutAttributeBottomMargin
                        multiplier:1 constant:0]];
                } else {
                    [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeBottom
                        relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottomMargin
                        multiplier:1 constant:0]];
                }

                break;
            }

            case LMVerticalAlignmentCenter: {
                [constraints addObject:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeCenterY
                    relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY
                    multiplier:1 constant:0]];

                break;
            }
        }

        previousSubview = subview;
    }

    // Align final view to trailing edge
    if (previousSubview != nil && horizontalAlignment != LMHorizontalAlignmentLeading) {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:previousSubview attribute:NSLayoutAttributeTrailing
            relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailingMargin
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

    return CGSizeMake(0, UIViewNoIntrinsicMetric);
}

@end
