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
 * Table view cell that hosts custom content.
 */
@interface LMTableViewCell : UITableViewCell

/**
 * Returns the cell's content.
 */
- (UIView *)content;

/**
 * Sets the cell's content.
 *
 * @param content The cell's content.
 * @param ignoreMargins Indicates that the cell's layout margins should be ignored.
 */
- (void)setContent:(nullable UIView *)content ignoreMargins:(BOOL)ignoreMargins;

@end

NS_ASSUME_NONNULL_END
