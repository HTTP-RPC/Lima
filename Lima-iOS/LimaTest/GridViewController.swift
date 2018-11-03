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

class GridViewController: UIViewController {
    override func loadView() {
        let cellStyle = { (cell: UIView) in
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
        }

        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

        view = LMScrollView(isFitToWidth: true, backgroundColor: UIColor.white,
            LMColumnView(margin: 16,
                // Fill
                UILabel(text: text, numberOfLines: 0, with: cellStyle),

                // Baselines
                LMColumnView(isAlignToGrid: true,
                    LMRowView(isAlignToBaseline: true,
                        UILabel(text: "First Baseline", textAlignment: .right,
                            with: cellStyle),
                        LMColumnView(weight: 1,
                            UILabel(text: text, numberOfLines: 0),
                            UILabel(text: text, numberOfLines: 0),
                            with: cellStyle
                        )
                    ),

                    LMRowView(isAlignToBaseline: true, baseline: .last,
                        UILabel(text: "Last Baseline", textAlignment: .right,
                            with: cellStyle),

                        LMColumnView(weight: 1,
                            UILabel(text: text, numberOfLines: 0),
                            UILabel(text: text, numberOfLines: 0),
                            with: cellStyle
                        )
                    )
                ),

                // Weights
                LMRowView(weight: 2,
                    LMColumnView(weight: 2,
                        UILabel(text: text, numberOfLines: 0),
                        LMSpacer(),
                        with: cellStyle
                    ),

                    UILabel(text: text, numberOfLines: 0, weight: 1,
                        with: cellStyle)
                )
            )
        )
    }
}
