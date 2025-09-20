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

class HitTestViewController: UIViewController {
    override func loadView() {
        view = LMAnchorView(backgroundColor: .white) {
            UIButton(configuration: .tinted(), primaryAction: UIAction() { _ in }, anchor: [.all])
            
            LMColumnView(anchor: [.all]) {
                LMRowView(weight: 1) {
                    UILabel(text: "Transparent Row View", textAlignment: .center)
                }
                LMRowView(backgroundColor: UIColor(0xffffff, alpha: 0.5), weight: 1) {
                    UILabel(text: "Opaque Row View", textAlignment: .center)
                }
                LMAnchorView(weight: 1) {
                    LMSpacer() { spacer in
                        spacer.anchor = [.all]
                    }
                    
                    UILabel(text: "Transparent Spacer")
                }
                LMAnchorView(weight: 1) {
                    LMSpacer(backgroundColor: UIColor(0xffffff, alpha: 0.5)) { spacer in
                        spacer.anchor = [.all]
                    }
                    
                    UILabel(text: "Opaque Spacer")
                }
            }
        }
    }
}

