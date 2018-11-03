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

class HorizontalAlignmentViewController: UIViewController {
    override func loadView() {
        let phoneIcon = UIImage(named: "PhoneIcon")
        let faxIcon = UIImage(named: "FaxIcon")
        let emailIcon = UIImage(named: "EmailIcon")

        let cellStyle = { (cell: UIView) in
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
        }

        view = LMScrollView(isFitToWidth: true, backgroundColor: UIColor.white,
            LMColumnView(margin: 8,
                // Leading alignment
                UILabel(text: "Leading", font: UIFont.systemFont(ofSize: 14)),

                LMRowView(margin: 8, horizontalAlignment: .leading,
                    UIImageView(image: phoneIcon, tintColor: UIColor.black),
                    UIImageView(image: faxIcon, tintColor: UIColor.black),
                    UIImageView(image: emailIcon, tintColor: UIColor.black),
                    with: cellStyle
                ),

                LMColumnView(margin: 8, horizontalAlignment: .leading,
                    UIImageView(image: phoneIcon, tintColor: UIColor.black),
                    UIImageView(image: faxIcon, tintColor: UIColor.black),
                    UIImageView(image: emailIcon, tintColor: UIColor.black),
                    with: cellStyle
                ),

                LMSpacer(height: 0.5, backgroundColor: UIColor.gray),

                // Trailing alignment
                UILabel(text: "Trailing", font: UIFont.systemFont(ofSize: 14)),

                LMRowView(margin: 8, horizontalAlignment: .trailing,
                    UIImageView(image: phoneIcon, tintColor: UIColor.black),
                    UIImageView(image: faxIcon, tintColor: UIColor.black),
                    UIImageView(image: emailIcon, tintColor: UIColor.black),
                    with: cellStyle
                ),

                LMColumnView(margin: 8, horizontalAlignment: .trailing,
                    UIImageView(image: phoneIcon, tintColor: UIColor.black),
                    UIImageView(image: faxIcon, tintColor: UIColor.black),
                    UIImageView(image: emailIcon, tintColor: UIColor.black),
                    with: cellStyle
                ),

                LMSpacer(height: 0.5, backgroundColor: UIColor.gray),

                // Center alignment
                UILabel(text: "Center", font: UIFont.systemFont(ofSize: 14)),

                LMColumnView(margin: 8, horizontalAlignment: .center,
                    UIImageView(image: phoneIcon, tintColor: UIColor.black),
                    UIImageView(image: faxIcon, tintColor: UIColor.black),
                    UIImageView(image: emailIcon, tintColor: UIColor.black),
                    with: cellStyle
                ),

                LMSpacer(height: 0.5, backgroundColor: UIColor.gray),

                // Fill alignment
                UILabel(text: "Fill", font: UIFont.systemFont(ofSize: 14)),

                LMRowView(margin: 8, horizontalAlignment: .fill,
                    UIImageView(image: phoneIcon, contentMode: .center, tintColor: UIColor.black, weight: 1),
                    UIImageView(image: faxIcon, contentMode: .center, tintColor: UIColor.black, weight: 1),
                    UIImageView(image: emailIcon, contentMode: .center, tintColor: UIColor.black, weight: 1),
                    with: cellStyle
                )
            )
        )
    }
}
