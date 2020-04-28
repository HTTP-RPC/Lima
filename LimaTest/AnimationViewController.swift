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

class AnimationViewController: UIViewController {
    var detailView: LMColumnView!

    override func loadView() {
        let backgroundColor = UIColor(0x000000, alpha: 0.75)
        let textColor = UIColor(0xffffff, alpha: 0.9)

        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

        view = LMAnchorView(margin: 0,
            UIImageView(image: UIImage(named: "daisies.jpg"), contentMode: .scaleAspectFill, anchor: [.all]),

            LMColumnView(spacing: 0, backgroundColor: backgroundColor, anchor: [.bottom, .left, .right],
                LMColumnView(margin: 8, verticalAlignment: .top, spacing: 0,
                    UILabel(text: text,
                        textColor: textColor,
                        font: UIFont.systemFont(ofSize: 14),
                        numberOfLines: 0)
                ) { detailView in
                    detailView.clipsToBounds = true

                    self.detailView = detailView
                },

                LMSpacer(height: 0.5, backgroundColor: UIColor.gray),

                LMRowView(margin: 8,
                    UILabel(text: "Show Detail",
                        textColor: textColor,
                        weight: 1),
                    UISwitch(onTintColor: UIColor.lightGray) { detailSwitch in
                        detailSwitch.on(.valueChanged) { [weak self] sender in
                            self?.toggleDetail(sender)
                        }
                    }
                )
            )
        )
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewRespectsSystemMinimumLayoutMargins = false

        detailView.height = 0
    }

    func toggleDetail(_ sender: UISwitch) {
        view.layoutIfNeeded()

        detailView.height = sender.isOn ? 175 : 0

        UIView.animate(withDuration: 0.33, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
