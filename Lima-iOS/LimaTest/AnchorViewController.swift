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
import Lima

class AnchorViewController: UIViewController {
    override func loadView() {
        let cellStyle = { (cell: UIView) in
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
        }

        view = LMRootView(backgroundColor: UIColor.white,
            subview: LMAnchorView(margin: 16, subviews: [
                // All
                UILabel(anchor: [.all], with: cellStyle),

                // Top
                UILabel(text: "Top Leading", anchor: [.top, .leading], with: cellStyle),
                UILabel(text: "Top", anchor: [.top], with: cellStyle),
                UILabel(text: "Top Trailing", anchor: [.top, .trailing], with: cellStyle),

                // Middle
                UILabel(text: "Leading", anchor: [.leading], with: cellStyle),
                UILabel(text: "None", anchor: [], with: cellStyle),
                UILabel(text: "Trailing", anchor: [.trailing], with: cellStyle),

                // Bottom
                UILabel(text: "Bottom Leading", anchor: [.bottom, .leading], with: cellStyle),
                UILabel(text: "Bottom", anchor: [.bottom], with: cellStyle),
                UILabel(text: "Bottom Trailing", anchor: [.bottom, .trailing], with: cellStyle)
            ])
        )
    }
}
