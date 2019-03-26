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

import UIKit

public extension LMTableViewCell {
    convenience init(accessoryType: UITableViewCell.AccessoryType = .none,
        selectionStyle: UITableViewCell.SelectionStyle = .blue,
        _ content: UIView? = nil,
        with: ((LMTableViewCell) -> Void)? = nil) {
        self.init()

        setContent(content, ignoreMargins: false)

        self.accessoryType = accessoryType
        self.selectionStyle = selectionStyle

        with?(self)
    }
}
