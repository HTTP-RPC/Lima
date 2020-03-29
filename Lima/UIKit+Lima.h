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

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * Anchor options.
 */
typedef NS_OPTIONS(NSUInteger, LMAnchor) {
    /** No anchor. */
    LMAnchorNone = 0,

    /** Top anchor. */
    LMAnchorTop = 1 << 0,

    /** Bottom anchor. */
    LMAnchorBottom = 1 << 1,

    /** Left anchor. */
    LMAnchorLeft = 1 << 2,

    /** Right anchor. */
    LMAnchorRight = 1 << 3,

    /** Leading anchor. */
    LMAnchorLeading = 1 << 4,

    /** Trailing anchor. */
    LMAnchorTrailing = 1 << 5,

    /** All anchors. */
    LMAnchorAll = LMAnchorTop | LMAnchorBottom | LMAnchorLeading | LMAnchorTrailing
};

@interface UIView (Lima)

/**
 * The view's width, or <code>NaN</code> for no explicit width.
 */
@property (nonatomic) CGFloat width;

/**
 * The view's height, or <code>NaN</code> for no explicit height.
 */
@property (nonatomic) CGFloat height;

/**
 * The view's weight, or <code>NaN</code> for no weight.
 */
@property (nonatomic) CGFloat weight;

/**
 * The view's anchors.
 */
@property (nonatomic) LMAnchor anchor;

/**
 * The view's displayable flag.
 */
@property (nonatomic) BOOL displayable NS_SWIFT_NAME(isDisplayable);

@end

NS_ASSUME_NONNULL_END
