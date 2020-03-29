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

#import "LMLayoutView.h"
#import "UIKit+Lima.h"

@implementation LMLayoutView {
    NSArray *_constraints;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self setLayoutMargins:UIEdgeInsetsZero];
    }

    return self;
}

- (id)awakeAfterUsingCoder:(NSCoder *)decoder {
    return nil;
}

- (void)didAddSubview:(UIView *)subview {
    [super didAddSubview:subview];

    [subview setTranslatesAutoresizingMaskIntoConstraints:NO];

    [self setNeedsUpdateConstraints];
}

- (void)willRemoveSubview:(UIView *)subview {
    [super willRemoveSubview:subview];

    [self setNeedsUpdateConstraints];
}

- (UIView *)viewForFirstBaselineLayout {
    NSArray *subviews = [self subviews];

    return ([subviews count] == 0) ? [super viewForFirstBaselineLayout] : [[subviews firstObject] viewForFirstBaselineLayout];
}

- (UIView *)viewForLastBaselineLayout {
    NSArray *subviews = [self subviews];

    return ([subviews count] == 0) ? [super viewForLastBaselineLayout] : [[subviews lastObject] viewForLastBaselineLayout];
}

- (void)setNeedsUpdateConstraints {
    if (_constraints != nil) {
        [NSLayoutConstraint deactivateConstraints:_constraints];

        _constraints = nil;
    }

    [super setNeedsUpdateConstraints];
}

- (void)updateConstraints {
    if (_constraints == nil) {
        _constraints = [self createConstraints];

        if (_constraints != nil) {
            [NSLayoutConstraint activateConstraints:_constraints];
        }
    }

    [super updateConstraints];
}

- (NSArray *)createConstraints {
    return nil;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];

    if (view == self && [self backgroundColor] == nil) {
        view = nil;
    }

    return view;
}

@end
