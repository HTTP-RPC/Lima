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
        let phoneIcon = UIImage(systemName: "phone.fill")
        let faxIcon = UIImage(systemName: "printer.fill")
        let emailIcon = UIImage(systemName: "envelope.fill")

        let cellStyle = { (cell: UIView) in
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
        }

        view = LMScrollView(isFitToHeight: true, backgroundColor: .white) {
            LMRowView(margin:8) {
                // Top alignment
                LMColumnView() {
                    UILabel(text: "Top", font: .systemFont(ofSize: 14))

                    LMRowView(weight: 1) {
                        LMColumnView(margin: 8, verticalAlignment: .top, with: cellStyle) {
                            UIImageView(image: phoneIcon, tintColor: .black)
                            UIImageView(image: faxIcon, tintColor: .black)
                            UIImageView(image: emailIcon, tintColor: .black)
                        }

                        LMRowView(margin: 8, verticalAlignment: .top, with: cellStyle) {
                            UIImageView(image: phoneIcon, tintColor: .black)
                            UIImageView(image: faxIcon, tintColor: .black)
                            UIImageView(image: emailIcon, tintColor: .black)
                        }
                    }
                }

                LMSpacer(width: 0.5, backgroundColor: .gray)

                // Bottom alignment
                LMColumnView() {
                    UILabel(text: "Bottom", font: .systemFont(ofSize: 14))

                    LMRowView(weight: 1) {
                        LMColumnView(margin: 8, verticalAlignment: .bottom, with: cellStyle) {
                            UIImageView(image: phoneIcon, tintColor: .black)
                            UIImageView(image: faxIcon, tintColor: .black)
                            UIImageView(image: emailIcon, tintColor: .black)
                        }

                        LMRowView(margin: 8, verticalAlignment: .bottom, with: cellStyle) {
                            UIImageView(image: phoneIcon, tintColor: .black)
                            UIImageView(image: faxIcon, tintColor: .black)
                            UIImageView(image: emailIcon, tintColor: .black)
                        }
                    }
                }

                LMSpacer(width: 0.5, backgroundColor: .gray)

                // Center alignment
                LMColumnView() {
                    UILabel(text: "Center", font: .systemFont(ofSize: 14))

                    LMRowView(margin: 8, verticalAlignment: .center, weight: 1, with: cellStyle) {
                        UIImageView(image: phoneIcon, tintColor: .black)
                        UIImageView(image: faxIcon, tintColor: .black)
                        UIImageView(image: emailIcon, tintColor: .black)
                    }
                }

                LMSpacer(width: 0.5, backgroundColor: .gray)

                // Fill alignment
                LMColumnView() {
                    UILabel(text: "Fill", font: .systemFont(ofSize: 14))

                    LMColumnView(margin: 8, with: cellStyle) {
                        UIImageView(image: phoneIcon, contentMode: .center, tintColor: .black, weight: 1)
                        UIImageView(image: faxIcon, contentMode: .center, tintColor: .black, weight: 1)
                        UIImageView(image: emailIcon, contentMode: .center, tintColor: .black, weight: 1)
                    }
                }
            }
        }
    }
}
