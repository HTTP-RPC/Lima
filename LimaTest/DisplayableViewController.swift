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
    var columnView: LMColumnView!
    var rowView: LMRowView!
    var anchorView: LMAnchorView!
    
    var displayableSwitch: UISwitch!
    var animatedSwitch: UISwitch!

    override func loadView() {
        view = LMColumnView(margin: 16, backgroundColor: .white,
            LMColumnView(weight: 1.5,
                UILabel(text: "One", textAlignment: .center, weight: 1) { label in
                    label.layer.borderWidth = 0.5
                    label.layer.borderColor = UIColor.lightGray.cgColor
                },
                UILabel(text: "Two", textAlignment: .center, weight: 1) { label in
                    label.layer.borderWidth = 0.5
                    label.layer.borderColor = UIColor.lightGray.cgColor
                },
                UILabel(text: "Three",  textAlignment: .center, weight: 1) { label in
                    label.layer.borderWidth = 0.5
                    label.layer.borderColor = UIColor.lightGray.cgColor
                }
            ) {
                columnView = $0
            },
            
            LMSpacer(height: 0.5, backgroundColor: .gray),

            LMRowView(weight: 1,
                UILabel(text: "One", textAlignment: .center, weight: 1) { label in
                    label.layer.borderWidth = 0.5
                    label.layer.borderColor = UIColor.lightGray.cgColor
                },
                UILabel(text: "Two", textAlignment: .center, weight: 1) { label in
                    label.layer.borderWidth = 0.5
                    label.layer.borderColor = UIColor.lightGray.cgColor
                },
                UILabel(text: "Three",  textAlignment: .center, weight: 1) { label in
                    label.layer.borderWidth = 0.5
                    label.layer.borderColor = UIColor.lightGray.cgColor
                }
            ) {
                rowView = $0
            },
            
            LMSpacer(height: 0.5, backgroundColor: .gray),

            LMAnchorView(weight: 1,
                UILabel(text: "One", textAlignment: .center, anchor: [.top, .bottom, .leading]) { label in
                    label.layer.borderWidth = 0.5
                    label.layer.borderColor = UIColor.lightGray.cgColor
                },
                UILabel(text: "Two", textAlignment: .center, anchor: [.all]) { label in
                    label.layer.borderWidth = 0.5
                    label.layer.borderColor = UIColor.lightGray.cgColor
                },
                UILabel(text: "Three",  textAlignment: .center, anchor: [.top, .bottom, .trailing]) { label in
                    label.layer.borderWidth = 0.5
                    label.layer.borderColor = UIColor.lightGray.cgColor
                }
            ) {
                anchorView = $0
            },
            
            LMSpacer(height: 0.5, backgroundColor: .gray),

            LMRowView(
                UILabel(text: "Displayable"),
                LMSpacer(),
                UISwitch(primaryAction: UIAction() { [unowned self] action in
                    toggleDisplayable()
                }) {
                    displayableSwitch = $0
                }
            ),

            LMRowView(
                UILabel(text: "Animated"),
                LMSpacer(),
                UISwitch(primaryAction: UIAction() { _ in }) {
                    animatedSwitch = $0
                }
            )
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayableSwitch.isOn = true
        
        toggleDisplayable()
    }

    func toggleDisplayable() {
        let displayable = displayableSwitch.isOn
        
        columnView.subviews[1].isDisplayable = displayable
        rowView.subviews[1].isDisplayable = displayable
        anchorView.subviews[1].isDisplayable = displayable

        if (animatedSwitch.isOn) {
            UIView.animate(withDuration: 0.33, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
}
