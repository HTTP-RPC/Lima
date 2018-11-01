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
    let emailIcon = UIImage(named: "EmailIcon")
    let faxIcon = UIImage(named: "FaxIcon")
    let phoneIcon = UIImage(named: "PhoneIcon")

    override func loadView() {
        view = LMScrollView(isFitToHeight: true, backgroundColor: UIColor.white,
            LMRowView(margin:8, [
                LMColumnView([
                    UILabel(text: "Top"),

                    LMRowView(weight: 1, [
                        LMColumnView(margin: 8, verticalAlignment: .top, [
                            UIImageView(image: emailIcon),
                            UIImageView(image: faxIcon),
                            UIImageView(image: phoneIcon)
                        ]) { $0.layer.borderWidth = 0.5; $0.layer.borderColor = UIColor.lightGray.cgColor },

                        LMRowView(margin: 8, verticalAlignment: .top, [
                            UIImageView(image: emailIcon),
                            UIImageView(image: faxIcon),
                            UIImageView(image: phoneIcon)
                        ]) { $0.layer.borderWidth = 0.5; $0.layer.borderColor = UIColor.lightGray.cgColor }
                    ])
                ]),

                LMSpacer(width: 0.5, backgroundColor: UIColor.gray),

                LMColumnView([
                    UILabel(text: "Bottom"),

                    LMRowView(weight: 1, [
                        LMColumnView(margin: 8, verticalAlignment: .bottom, [
                            UIImageView(image: emailIcon),
                            UIImageView(image: faxIcon),
                            UIImageView(image: phoneIcon)
                        ]) { $0.layer.borderWidth = 0.5; $0.layer.borderColor = UIColor.lightGray.cgColor },

                        LMRowView(margin: 8, verticalAlignment: .bottom, [
                            UIImageView(image: emailIcon),
                            UIImageView(image: faxIcon),
                            UIImageView(image: phoneIcon)
                        ]) { $0.layer.borderWidth = 0.5; $0.layer.borderColor = UIColor.lightGray.cgColor }
                    ])
                ]),

                LMSpacer(width: 0.5, backgroundColor: UIColor.gray),

                LMColumnView([
                    UILabel(text: "Center"),

                    LMRowView(margin: 8, verticalAlignment: .center, weight: 1, [
                        UIImageView(image: emailIcon),
                        UIImageView(image: faxIcon),
                        UIImageView(image: phoneIcon)
                    ]) { $0.layer.borderWidth = 0.5; $0.layer.borderColor = UIColor.lightGray.cgColor }
                ]),

                LMSpacer(width: 0.5, backgroundColor: UIColor.gray),

                LMColumnView([
                    UILabel(text: "Fill"),

                    LMColumnView(margin: 8, [
                        UIImageView(image: emailIcon, contentMode: .center, weight: 1),
                        UIImageView(image: faxIcon, contentMode: .center, weight: 1),
                        UIImageView(image: phoneIcon, contentMode: .center, weight: 1)
                    ]) { $0.layer.borderWidth = 0.5; $0.layer.borderColor = UIColor.lightGray.cgColor }
                ])
            ])
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Vertical Alignment"

        edgesForExtendedLayout = UIRectEdge()
    }
}
