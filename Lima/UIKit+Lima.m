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

#import "UIKit+Lima.h"

#import <objc/message.h>

@implementation UIView (Lima)

- (CGFloat)width {
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, @selector(width));

    return (constraint == nil) ? NAN : [constraint constant];
}

- (void)setWidth:(CGFloat)width {
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, @selector(width));

    [constraint setActive:NO];

    if (!isnan(width)) {
        constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth
            relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute
            multiplier:1 constant:width];
    } else {
        constraint = nil;
    }

    [constraint setActive:YES];

    objc_setAssociatedObject(self, @selector(width), constraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)height {
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, @selector(height));

    return (constraint == nil) ? NAN : [constraint constant];
}

- (void)setHeight:(CGFloat)height {
    NSLayoutConstraint *constraint = objc_getAssociatedObject(self, @selector(height));

    [constraint setActive:NO];

    if (!isnan(height)) {
        constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight
            relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute
            multiplier:1 constant:height];
    } else {
        constraint = nil;
    }

    [constraint setActive:YES];

    objc_setAssociatedObject(self, @selector(height), constraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)weight {
    NSNumber *weight = objc_getAssociatedObject(self, @selector(weight));

    return (weight == nil) ? NAN : [weight floatValue];
}

- (void)setWeight:(CGFloat)weight {
    objc_setAssociatedObject(self, @selector(weight), isnan(weight) ? nil : [NSNumber numberWithFloat:weight],
        OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    [[self superview] setNeedsUpdateConstraints];
}

- (LMAnchor)anchor {
    NSNumber *anchor = objc_getAssociatedObject(self, @selector(anchor));

    return (anchor == nil) ? 0 : [anchor unsignedIntegerValue];
}

- (void)setAnchor:(LMAnchor)anchor {
    objc_setAssociatedObject(self, @selector(anchor), [NSNumber numberWithUnsignedInteger:anchor],
        OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    [[self superview] setNeedsUpdateConstraints];
}

- (BOOL)displayable {
    NSNumber *displayable = objc_getAssociatedObject(self, @selector(displayable));

    return (displayable == nil) ? YES : [displayable boolValue];
}

- (void)setDisplayable:(BOOL)displayable {
    objc_setAssociatedObject(self, @selector(displayable), [NSNumber numberWithBool:displayable],
        OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    [self setHidden:!displayable];

    [[self superview] setNeedsUpdateConstraints];
}

@end

@implementation UIControl (Lima)

- (void)onControlEvents:(UIControlEvents)controlEvents invoke:(void (^)(id))actionHandler {
    switch (controlEvents) {
        case UIControlEventValueChanged: {
            [self addTarget:self action:@selector(onValueChanged) forControlEvents:UIControlEventValueChanged];
            [self setValueChangedHandler:actionHandler];
            break;
        }
        
        case UIControlEventPrimaryActionTriggered: {
            [self addTarget:self action:@selector(onPrimaryActionTriggered) forControlEvents:UIControlEventPrimaryActionTriggered];
            [self setPrimaryActionTriggeredHandler:actionHandler];
            break;
        }

        default: {
            [NSException raise:NSInvalidArgumentException format:@"Unsupported event type."];
        }
    }
}

- (void (^)(id))valueChangedHandler {
    return objc_getAssociatedObject(self, @selector(valueChangedHandler));
}

- (void)setValueChangedHandler:(void (^)(id))actionHandler {
    objc_setAssociatedObject(self, @selector(valueChangedHandler), actionHandler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)onValueChanged {
    [self valueChangedHandler](self);
}

- (void (^)(id))primaryActionTriggeredHandler {
    return objc_getAssociatedObject(self, @selector(primaryActionTriggeredHandler));
}

- (void)setPrimaryActionTriggeredHandler:(void (^)(id))actionHandler {
    objc_setAssociatedObject(self, @selector(primaryActionTriggeredHandler), actionHandler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)onPrimaryActionTriggered {
    [self primaryActionTriggeredHandler](self);
}

@end

@implementation UIBarButtonItem (Lima)

- (instancetype)initWithImage:(nullable UIImage *)image actionHandler:(void (^)(UIBarButtonItem *))actionHandler {
    self = [self initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(onAction)];
    
    if (self) {
        [self setActionHandler:actionHandler];
    }
    
    return self;
}

- (instancetype)initWithTitle:(nullable NSString *)title actionHandler:(void (^)(UIBarButtonItem *))actionHandler {
    self = [self initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(onAction)];

    if (self) {
        [self setActionHandler:actionHandler];
    }
    
    return self;
}

- (instancetype)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem actionHandler:(void (^)(UIBarButtonItem *))actionHandler {
    self = [self initWithBarButtonSystemItem:systemItem target:self action:@selector(onAction)];
    
    if (self) {
        [self setActionHandler:actionHandler];
    }
    
    return self;
}

- (void (^)(UIBarButtonItem *))actionHandler {
    return objc_getAssociatedObject(self, @selector(actionHandler));
}

- (void)setActionHandler:(void (^)(UIBarButtonItem *))actionHandler {
    objc_setAssociatedObject(self, @selector(actionHandler), actionHandler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)onAction {
    [self actionHandler](self);
}

@end
