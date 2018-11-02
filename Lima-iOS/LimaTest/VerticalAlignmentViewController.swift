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

class VerticalAlignmentViewController: UIViewController {
    override func loadView() {
        let emailIcon = UIImage(named: "EmailIcon")
        let faxIcon = UIImage(named: "FaxIcon")
        let phoneIcon = UIImage(named: "PhoneIcon")

        let cellStyle = { (cell: UIView) in
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
        }

        view = LMScrollView(isFitToHeight: true, backgroundColor: UIColor.white,
            content: LMRowView(margin:8, subviews: [
                // Top alignment
                LMColumnView(subviews: [
                    UILabel(text: "Top", font: UIFont.systemFont(ofSize: 14)),

                    LMRowView(weight: 1, subviews: [
                        LMColumnView(margin: 8, verticalAlignment: .top, subviews: [
                            UIImageView(image: emailIcon, tintColor: UIColor.black),
                            UIImageView(image: faxIcon, tintColor: UIColor.black),
                            UIImageView(image: phoneIcon, tintColor: UIColor.black)
                        ], with: cellStyle),

                        LMRowView(margin: 8, verticalAlignment: .top, subviews: [
                            UIImageView(image: emailIcon, tintColor: UIColor.black),
                            UIImageView(image: faxIcon, tintColor: UIColor.black),
                            UIImageView(image: phoneIcon, tintColor: UIColor.black)
                        ], with: cellStyle)
                    ])
                ]),

                LMSpacer(width: 0.5, backgroundColor: UIColor.gray),

                // Bottom alignment
                LMColumnView(subviews: [
                    UILabel(text: "Bottom", font: UIFont.systemFont(ofSize: 14)),

                    LMRowView(weight: 1, subviews: [
                        LMColumnView(margin: 8, verticalAlignment: .bottom, subviews: [
                            UIImageView(image: emailIcon, tintColor: UIColor.black),
                            UIImageView(image: faxIcon, tintColor: UIColor.black),
                            UIImageView(image: phoneIcon, tintColor: UIColor.black)
                        ], with: cellStyle),

                        LMRowView(margin: 8, verticalAlignment: .bottom, subviews: [
                            UIImageView(image: emailIcon, tintColor: UIColor.black),
                            UIImageView(image: faxIcon, tintColor: UIColor.black),
                            UIImageView(image: phoneIcon, tintColor: UIColor.black)
                        ], with: cellStyle)
                    ])
                ]),

                LMSpacer(width: 0.5, backgroundColor: UIColor.gray),

                // Center alignment
                LMColumnView(subviews: [
                    UILabel(text: "Center", font: UIFont.systemFont(ofSize: 14)),

                    LMRowView(margin: 8, verticalAlignment: .center, weight: 1, subviews: [
                        UIImageView(image: emailIcon, tintColor: UIColor.black),
                        UIImageView(image: faxIcon, tintColor: UIColor.black),
                        UIImageView(image: phoneIcon, tintColor: UIColor.black)
                    ], with: cellStyle)
                ]),

                LMSpacer(width: 0.5, backgroundColor: UIColor.gray),

                // Fill alignment
                LMColumnView(subviews: [
                    UILabel(text: "Fill", font: UIFont.systemFont(ofSize: 14)),

                    LMColumnView(margin: 8, subviews: [
                        UIImageView(image: emailIcon, contentMode: .center, tintColor: UIColor.black, weight: 1),
                        UIImageView(image: faxIcon, contentMode: .center, tintColor: UIColor.black, weight: 1),
                        UIImageView(image: phoneIcon, contentMode: .center, tintColor: UIColor.black, weight: 1)
                    ], with: cellStyle)
                ])
            ])
        )
    }
}
