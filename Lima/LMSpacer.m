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

#import "LMSpacer.h"
#import "UIKit+Lima.h"

@implementation LMSpacer

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self setWeight:1];
    }

    return self;
}

- (id)awakeAfterUsingCoder:(NSCoder *)decoder {
    return nil;
}

- (CGSize)intrinsicContentSize {
    return CGSizeZero;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return ([self backgroundColor] == nil) ? nil : [super hitTest:point withEvent:event];
}

@end
