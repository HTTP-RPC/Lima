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

class ViewController: UIViewController {
    var columnView: LMColumnView!

    override func loadView() {
        view = LMColumnView(spacing: 16, [
            LMSpacer(),
            UILabel(text: "One", textAlignment: .center, textColor: .red),
            UILabel(text: "Two", textAlignment: .center, textColor: .green) {
                $0.isDisplayable = false                
            },
            UILabel(text: "Three", textAlignment: .center, textColor: .blue),
            LMSpacer(height: 0.5, backgroundColor: .gray),
            UIButton(type: .system, title: "Press Me"),
            LMSpacer()
        ]) { self.columnView = $0}
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lima Test"
    }
}

