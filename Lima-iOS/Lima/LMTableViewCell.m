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

#import "LMTableViewCell.h"

@implementation LMTableViewCell {
    UIView *_content;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (UIView *)content {
    return _content;
}

- (void)setContent:(UIView *)content ignoreMargins:(BOOL)ignoreMargins {
    [_content removeFromSuperview];

    _content = content;

    if (_content != nil) {
        [_content setTranslatesAutoresizingMaskIntoConstraints:NO];

        [_content setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        [_content setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];

        [_content setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_content setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];

        UIView *contentView = [self contentView];

        [contentView addSubview:_content];

        // Pin content to cell edges
        NSLayoutAttribute topAttribute, bottomAttribute, leftAttribute, rightAttribute;
        if (ignoreMargins) {
            topAttribute = NSLayoutAttributeTop;
            bottomAttribute = NSLayoutAttributeBottom;
            leftAttribute = NSLayoutAttributeLeft;
            rightAttribute = NSLayoutAttributeRight;
        } else {
            topAttribute = NSLayoutAttributeTopMargin;
            bottomAttribute = NSLayoutAttributeBottomMargin;
            leftAttribute = NSLayoutAttributeLeftMargin;
            rightAttribute = NSLayoutAttributeRightMargin;
        }

        NSMutableArray *constraints = [NSMutableArray new];

        [constraints addObject:[NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeTop
            relatedBy:NSLayoutRelationEqual toItem:contentView attribute:topAttribute
            multiplier:1 constant:0]];
        [constraints addObject:[NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeBottom
            relatedBy:NSLayoutRelationEqual toItem:contentView attribute:bottomAttribute
            multiplier:1 constant:0]];

        [constraints addObject:[NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeLeft
            relatedBy:NSLayoutRelationEqual toItem:contentView attribute:leftAttribute
            multiplier:1 constant:0]];
        [constraints addObject:[NSLayoutConstraint constraintWithItem:_content attribute:NSLayoutAttributeRight
            relatedBy:NSLayoutRelationEqual toItem:contentView attribute:rightAttribute
            multiplier:1 constant:0]];

        [NSLayoutConstraint activateConstraints:constraints];
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    
    if (view == [self contentView] && [self selectionStyle] == UITableViewCellSelectionStyleNone) {
        view = nil;
    }

    return view;
}

@end
