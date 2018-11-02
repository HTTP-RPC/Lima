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

public extension LMRootView {
    public convenience init(topPadding: CGFloat = 0, bottomPadding: CGFloat = 0,
        backgroundColor: UIColor? = nil,
        subview: UIView,
        with: ((LMRootView) -> Void)? = nil) {
        self.init()

        self.topPadding = topPadding
        self.bottomPadding = bottomPadding

        self.backgroundColor = backgroundColor

        addSubview(subview)

        with?(self)
    }
}
