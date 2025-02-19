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
        let phoneIcon = UIImage(systemName: "phone.fill")
        let faxIcon = UIImage(systemName: "printer.fill")
        let emailIcon = UIImage(systemName: "envelope.fill")

        let cellStyle = { (cell: UIView) in
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
        }

        view = LMScrollView(isFitToWidth: true, backgroundColor: .white,
            LMColumnView(margin: 8,
                // Leading alignment
                UILabel(text: "Leading", font: .systemFont(ofSize: 14)),

                LMRowView(margin: 8, horizontalAlignment: .leading, with: cellStyle,
                    UIImageView(image: phoneIcon, tintColor: .black),
                    UIImageView(image: faxIcon, tintColor: .black),
                    UIImageView(image: emailIcon, tintColor: .black)
                ),

                LMColumnView(margin: 8, horizontalAlignment: .leading, with: cellStyle,
                    UIImageView(image: phoneIcon, tintColor: .black),
                    UIImageView(image: faxIcon, tintColor: .black),
                    UIImageView(image: emailIcon, tintColor: .black)
                ),

                LMSpacer(height: 0.5, backgroundColor: .gray),

                // Trailing alignment
                UILabel(text: "Trailing", font: .systemFont(ofSize: 14)),

                LMRowView(margin: 8, horizontalAlignment: .trailing, with: cellStyle,
                    UIImageView(image: phoneIcon, tintColor: .black),
                    UIImageView(image: faxIcon, tintColor: .black),
                    UIImageView(image: emailIcon, tintColor: .black)
                ),

                LMColumnView(margin: 8, horizontalAlignment: .trailing, with: cellStyle,
                    UIImageView(image: phoneIcon, tintColor: .black),
                    UIImageView(image: faxIcon, tintColor: .black),
                    UIImageView(image: emailIcon, tintColor: .black)
                ),

                LMSpacer(height: 0.5, backgroundColor: .gray),

                // Center alignment
                UILabel(text: "Center", font: .systemFont(ofSize: 14)),

                LMColumnView(margin: 8, horizontalAlignment: .center, with: cellStyle,
                    UIImageView(image: phoneIcon, tintColor: .black),
                    UIImageView(image: faxIcon, tintColor: .black),
                    UIImageView(image: emailIcon, tintColor: .black)
                ),

                LMSpacer(height: 0.5, backgroundColor: .gray),

                // Fill alignment
                UILabel(text: "Fill", font: .systemFont(ofSize: 14)),

                LMRowView(margin: 8, horizontalAlignment: .fill, with: cellStyle,
                    UIImageView(image: phoneIcon, contentMode: .center, tintColor: .black, weight: 1),
                    UIImageView(image: faxIcon, contentMode: .center, tintColor: .black, weight: 1),
                    UIImageView(image: emailIcon, contentMode: .center, tintColor: .black, weight: 1)
                )
            )
        )
    }
}
