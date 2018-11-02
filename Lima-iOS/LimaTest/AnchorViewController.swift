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
        view = LMRootView(backgroundColor: UIColor.white,
            subview: LMAnchorView(margin: 16, subviews: [
                // All
                UILabel(anchor: [.all]) {
                    $0.layer.borderWidth = 0.5
                    $0.layer.borderColor = UIColor.lightGray.cgColor
                },

                // Top
                UILabel(text: "Top Leading", anchor: [.top, .leading]) {
                    $0.layer.borderWidth = 0.5
                    $0.layer.borderColor = UIColor.lightGray.cgColor
                },
                UILabel(text: "Top", anchor: [.top]) {
                    $0.layer.borderWidth = 0.5
                    $0.layer.borderColor = UIColor.lightGray.cgColor
                },
                UILabel(text: "Top Trailing", anchor: [.top, .trailing]) {
                    $0.layer.borderWidth = 0.5
                    $0.layer.borderColor = UIColor.lightGray.cgColor
                },

                // Middle
                UILabel(text: "Leading", anchor: [.leading]) {
                    $0.layer.borderWidth = 0.5
                    $0.layer.borderColor = UIColor.lightGray.cgColor
                },

                UILabel(text: "None", anchor: []) {
                    $0.layer.borderWidth = 0.5
                    $0.layer.borderColor = UIColor.lightGray.cgColor
                },

                UILabel(text: "Trailing", anchor: [.trailing]) {
                    $0.layer.borderWidth = 0.5
                    $0.layer.borderColor = UIColor.lightGray.cgColor
                },

                // Bottom
                UILabel(text: "Bottom Leading", anchor: [.bottom, .leading]) {
                    $0.layer.borderWidth = 0.5
                    $0.layer.borderColor = UIColor.lightGray.cgColor
                },
                UILabel(text: "Bottom", anchor: [.bottom]) {
                    $0.layer.borderWidth = 0.5
                    $0.layer.borderColor = UIColor.lightGray.cgColor
                },
                UILabel(text: "Bottom Trailing", anchor: [.bottom, .trailing]) {
                    $0.layer.borderWidth = 0.5
                    $0.layer.borderColor = UIColor.lightGray.cgColor
                }
            ])
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Anchor View"
        
        edgesForExtendedLayout = UIRectEdge()
    }
}
