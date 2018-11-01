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
    let emailIcon = UIImage(named: "EmailIcon")
    let faxIcon = UIImage(named: "FaxIcon")
    let phoneIcon = UIImage(named: "PhoneIcon")

    override func loadView() {
        view = LMScrollView(isFitToWidth: true, backgroundColor: UIColor.white,
            LMColumnView(margin: 8, [
                UILabel(text: "Leading"),

                LMRowView(margin: 8, horizontalAlignment: .leading, [
                    UIImageView(image: emailIcon),
                    UIImageView(image: faxIcon),
                    UIImageView(image: phoneIcon)
                ]) { $0.layer.borderWidth = 0.5; $0.layer.borderColor = UIColor.lightGray.cgColor },

                LMColumnView(margin: 8, horizontalAlignment: .leading, [
                    UIImageView(image: emailIcon),
                    UIImageView(image: faxIcon),
                    UIImageView(image: phoneIcon)
                ]) { $0.layer.borderWidth = 0.5; $0.layer.borderColor = UIColor.lightGray.cgColor },

                LMSpacer(height: 0.5, backgroundColor: UIColor.gray),

                UILabel(text: "Trailing"),

                LMRowView(margin: 8, horizontalAlignment: .trailing, [
                    UIImageView(image: emailIcon),
                    UIImageView(image: faxIcon),
                    UIImageView(image: phoneIcon)
                ]) { $0.layer.borderWidth = 0.5; $0.layer.borderColor = UIColor.lightGray.cgColor },

                LMColumnView(margin: 8, horizontalAlignment: .trailing, [
                    UIImageView(image: emailIcon),
                    UIImageView(image: faxIcon),
                    UIImageView(image: phoneIcon)
                ]) { $0.layer.borderWidth = 0.5; $0.layer.borderColor = UIColor.lightGray.cgColor },

                LMSpacer(height: 0.5, backgroundColor: UIColor.gray),

                UILabel(text: "Center"),

                LMColumnView(margin: 8, horizontalAlignment: .center, [
                    UIImageView(image: emailIcon),
                    UIImageView(image: faxIcon),
                    UIImageView(image: phoneIcon)
                ]) { $0.layer.borderWidth = 0.5; $0.layer.borderColor = UIColor.lightGray.cgColor },

                LMSpacer(height: 0.5, backgroundColor: UIColor.gray),

                UILabel(text: "Fill"),

                LMRowView(margin: 8, horizontalAlignment: .fill, [
                    UIImageView(image: emailIcon, contentMode: .center, weight: 1),
                    UIImageView(image: faxIcon, contentMode: .center, weight: 1),
                    UIImageView(image: phoneIcon, contentMode: .center, weight: 1)
                ]) { $0.layer.borderWidth = 0.5; $0.layer.borderColor = UIColor.lightGray.cgColor }
            ])
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Horizontal Alignment"         

        edgesForExtendedLayout = UIRectEdge()
    }
}
