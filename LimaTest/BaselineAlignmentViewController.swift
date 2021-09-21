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

class BaselineAlignmentViewController: UIViewController {
    override func loadView() {
        let cellStyle = { (cell: UIView) in
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
        }

        view = LMScrollView(isFitToWidth: true, backgroundColor: .white,
            LMColumnView(margin: 8,
                LMRowView(margin: 4, isAlignToBaseline: true,
                    LMSpacer(),
                    UILabel(text: "abcd", font: .systemFont(ofSize: 16)),
                    UILabel(text: "efg", font: .systemFont(ofSize: 32)),
                    UILabel(text: "hijk", font: .systemFont(ofSize: 24)),
                    LMSpacer(),
                    with: cellStyle
                ),
                
                LMColumnView(margin: 4, horizontalAlignment: .center, isAlignToBaseline: true,
                    UILabel(text: "abcd", font: .systemFont(ofSize: 16)),
                    UILabel(text: "efg", font: .systemFont(ofSize: 32)),
                    UILabel(text: "hijk", font: .systemFont(ofSize: 24)),
                    with: cellStyle
                )
            )
        )
    }
}
