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

#import "LMBoxView.h"

@implementation LMBoxView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        _spacing = NAN;
    }

    return self;
}

- (void)setHorizontalAlignment:(LMHorizontalAlignment)horizontalAlignment {
    _horizontalAlignment = horizontalAlignment;

    [self setNeedsUpdateConstraints];
}

- (void)setVerticalAlignment:(LMVerticalAlignment)verticalAlignment {
    _verticalAlignment = verticalAlignment;

    [self setNeedsUpdateConstraints];
}

- (void)setSpacing:(CGFloat)spacing {
    _spacing = spacing;

    [self setNeedsUpdateConstraints];
}

- (void)setAlignToBaseline:(BOOL)alignToBaseline {
    _alignToBaseline = alignToBaseline;

    [self setNeedsUpdateConstraints];
}

@end
