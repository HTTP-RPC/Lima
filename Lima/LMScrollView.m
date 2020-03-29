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

#import "LMScrollView.h"

@implementation LMScrollView {
    NSArray *_constraints;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (id)awakeAfterUsingCoder:(NSCoder *)decoder {
    return nil;
}

- (void)setFitToWidth:(BOOL)fitToWidth {
    _fitToWidth = fitToWidth;

    [self setNeedsUpdateConstraints];
}

- (void)setFitToHeight:(BOOL)fitToHeight {
    _fitToHeight = fitToHeight;

    [self setNeedsUpdateConstraints];
}

- (void)setContent:(UIView *)content {
    [_content removeFromSuperview];

    _content = content;

    if (_content != nil) {
        [self addSubview:_content];

        [_content setTranslatesAutoresizingMaskIntoConstraints:NO];
    }

    [self setNeedsUpdateConstraints];
}

- (void)willRemoveSubview:(UIView *)subview {
    if (subview == _content) {
        _content = nil;

        [self setNeedsUpdateConstraints];
    }

    [super willRemoveSubview:subview];
}

- (void)layoutSubviews {
    // Ensure that content resizes
    if (_content != nil) {
        UILayoutPriority horizontalPriority = (_fitToWidth) ? UILayoutPriorityDefaultLow : UILayoutPriorityRequired;

        [_content setContentCompressionResistancePriority:horizontalPriority forAxis:UILayoutConstraintAxisHorizontal];
        [_content setContentHuggingPriority:horizontalPriority forAxis:UILayoutConstraintAxisHorizontal];

        UILayoutPriority verticalPriority = (_fitToHeight) ? UILayoutPriorityDefaultLow : UILayoutPriorityRequired;

        [_content setContentCompressionResistancePriority:verticalPriority forAxis:UILayoutConstraintAxisVertical];
        [_content setContentHuggingPriority:verticalPriority forAxis:UILayoutConstraintAxisVertical];
    }

    [super layoutSubviews];
}

- (void)setNeedsUpdateConstraints {
    if (_constraints != nil) {
        [self removeConstraints:_constraints];

        _constraints = nil;
    }

    if (_content == nil) {
        return;
    }

    [super setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (_constraints == nil) {
        if (_content != nil) {
            NSMutableArray *constraints = [NSMutableArray new];

            // Align content edges to scroll view edges
            [constraints addObject:[NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeTop
                relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop
                multiplier:1 constant:0]];
            [constraints addObject:[NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeBottom
                relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom
                multiplier:1 constant:0]];

            [constraints addObject:[NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeLeft
                relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft
                multiplier:1 constant:0]];
            [constraints addObject:[NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeRight
                relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight
                multiplier:1 constant:0]];

            // Match content width/height to scroll view width/height
            if (_fitToWidth) {
                [constraints addObject:[NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeWidth
                    relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth
                    multiplier:1 constant:0]];
            }

            if (_fitToHeight) {
                [constraints addObject:[NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeHeight
                    relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight
                    multiplier:1 constant:0]];
            }

            _constraints = constraints;
        }

        if (_constraints != nil) {
            [NSLayoutConstraint activateConstraints:_constraints];
        }
    }

    [super updateConstraints];
}

@end
