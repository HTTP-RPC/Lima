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

@interface UIView (Markup)

/**
 * The view's width, or <code>NaN</code> for no explicit width.
 */
@property (nonatomic) CGFloat width;

/**
 * The view's minimum width, or <code>NaN</code> for no explicit minimum width.
 */
@property (nonatomic) CGFloat minimumWidth;

/**
 * The view's maximum width, or <code>NaN</code> for no explicit maximum width.
 */
@property (nonatomic) CGFloat maximumWidth;

/**
 * The view's height, or <code>NaN</code> for no explicit height.
 */
@property (nonatomic) CGFloat height;

/**
 * The view's minimum height, or <code>NaN</code> for no explicit minimum height.
 */
@property (nonatomic) CGFloat minimumHeight;

/**
 * The view's maximum height, or <code>NaN</code> for no explicit maximum height.
 */
@property (nonatomic) CGFloat maximumHeight;

/**
 * The view's aspect ratio, or <code>NaN</code> for no explicit aspect ratio.
 */
@property (nonatomic) CGFloat aspectRatio;

/**
 * The view's weight, or <code>NaN</code> for no weight.
 */
@property (nonatomic) CGFloat weight;

/**
 * The top layout margin.
 */
@property (nonatomic) CGFloat layoutMarginTop;

/**
 * The left layout margin.
 */
@property (nonatomic) CGFloat layoutMarginLeft;

/**
 * The bottom layout margin.
 */
@property (nonatomic) CGFloat layoutMarginBottom;

/**
 * The right layout margin.
 */
@property (nonatomic) CGFloat layoutMarginRight;

/**
 * The leading layout margin.
 */
@property (nonatomic) CGFloat layoutMarginLeading;

/**
 * The trailing layout margin.
 */
@property (nonatomic) CGFloat layoutMarginTrailing;

/**
 * The amount of space to reserve above the view. The default is 0.
 */
@property (nonatomic) CGFloat topSpacing;

/**
 * The amount of space to reserve below the view. The default is 0.
 */
@property (nonatomic) CGFloat bottomSpacing;

/**
 * The amount of space to reserve at the view's leading edge. The default is 0.
 */
@property (nonatomic) CGFloat leadingSpacing;

/**
 * The amount of space to reserve at the view's trailing edge. The default is 0.
 */
@property (nonatomic) CGFloat trailingSpacing;

/**
 * The view's anchors.
 */
@property (nonatomic) LMAnchor anchor;

@end

NS_ASSUME_NONNULL_END
