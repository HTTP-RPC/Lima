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

class DisplayableViewController: UIViewController {
    var secondLabel: UILabel!

    override func loadView() {
        let labelStyle = { (label: UILabel) in
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 24)

            label.layer.borderWidth = 0.5
            label.layer.borderColor = UIColor.lightGray.cgColor

            label.weight = 1
        }

        view = LMColumnView(margin: 16, spacing: 16, backgroundColor: UIColor.white,
            LMRowView(weight: 1,
                UILabel(text: "One", with: labelStyle),
                UILabel(text: "Two") { labelStyle($0); self.secondLabel = $0 },
                UILabel(text: "Three", with: labelStyle)
            ),

            UISegmentedControl() { segmentedControl in
                segmentedControl.insertSegment(withTitle: "Displayable", at: 0, animated: false)
                segmentedControl.insertSegment(withTitle: "Not Displayable", at: 1, animated: false)

                segmentedControl.selectedSegmentIndex = 0

                self.update(segmentedControl)

                segmentedControl.addTarget(self, action: #selector(self.update(_:)), for: .valueChanged)
            },

            LMSpacer(weight: 4)
        )
    }

    @objc func update(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            secondLabel.isDisplayable = true

        case 1:
            secondLabel.isDisplayable = false

        default:
            fatalError()
        }
    }
}
