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

NS_ASSUME_NONNULL_BEGIN

/**
 * Layout view that provides a margin-independent root for a view hierarchy.
 */
@interface LMRootView : LMLayoutView

/**
 * The amount of space to reserve at the top of the view. The default is 0.
 */
@property (nonatomic) CGFloat topPadding;

/**
 * The amount of space to reserve at the bottom of the view. The default is 0.
 */
@property (nonatomic) CGFloat bottomPadding;

@end

NS_ASSUME_NONNULL_END
