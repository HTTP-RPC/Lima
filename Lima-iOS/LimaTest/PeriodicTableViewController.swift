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

class PeriodicTableViewController: UIViewController {
    // Element groups
    enum Group {
        case alkaliMetal
        case alkalineEarthMetal
        case lanthanide
        case actinide
        case transitionMetal
        case postTransitionMetal
        case metalloid
        case reactiveNonmetal
        case nobleGas
        case unknown

        var color: UIColor {
            let color: UIColor

            switch (self) {
            case .alkaliMetal:
                color = UIColor(0xff6268)

            case .alkalineEarthMetal:
                color = UIColor(0xffddb2)

            case .lanthanide:
                color = UIColor(0xffbffb)

            case .actinide:
                color = UIColor(0xff98c9)

            case .transitionMetal:
                color = UIColor(0xffbfc1)

            case .postTransitionMetal:
                color = UIColor(0xcccccc)

            case .metalloid:
                color = UIColor(0xcbcc9e)

            case .reactiveNonmetal:
                color = UIColor(0xe5ff9c)

            case .nobleGas:
                color = UIColor(0xbeffff)

            case .unknown:
                color = UIColor(0xe8e8e8)
            }

            return color
        }
    }

    // Element view
    class ElementView: LMColumnView {
        init() {
            super.init(frame: CGRect())

            width = 48
            height = 48
        }

        convenience init(_ number: Int, _ symbol: String, _ group: Group) {
            self.init()

            layoutMargins = UIEdgeInsets(top: 4, left: 2, bottom: 2, right: 2)

            spacing = 0

            addSubview(UILabel(text: String(number),
                textAlignment: .center,
                textColor: UIColor(0x0c47a7),
                font: UIFont.preferredFont(forTextStyle: .caption1)))

            addSubview(UILabel(text: symbol,
                textAlignment: .center,
                textColor: UIColor(0x0c47a7),
                font: UIFont.preferredFont(forTextStyle: .body)))

            backgroundColor = group.color

            layer.borderColor = UIColor(0x8d1af6).cgColor
            layer.borderWidth = 0.5
        }

        required init?(coder decoder: NSCoder) {
            return nil
        }
    }

    // Key view
    // TODO Use a column view and add a margin
    class KeyView: UILabel {
        init(_ text: String, _ group: Group) {
            super.init(frame: CGRect())

            self.text = text

            font = UIFont.preferredFont(forTextStyle: .caption1)
            textAlignment = .center
            numberOfLines = 0

            backgroundColor = group.color

            weight = 1
        }

        required init?(coder decoder: NSCoder) {
            return nil
        }
    }

    override func loadView() {
        let rowStyle = { (row: LMRowView) in
            row.spacing = 4
        }

        view = LMScrollView(backgroundColor: UIColor(0xffffff),
            LMColumnView(margin: 8, spacing: 16,
                LMColumnView(
                    LMRowView(
                        ElementView(1, "H", .reactiveNonmetal),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(2, "He", .nobleGas),
                        with: rowStyle
                    ),
                    LMRowView(
                        ElementView(3, "Li", .alkaliMetal),
                        ElementView(4, "Be", .alkalineEarthMetal),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(5, "B", .metalloid),
                        ElementView(6, "C", .reactiveNonmetal),
                        ElementView(7, "N", .reactiveNonmetal),
                        ElementView(8, "O", .reactiveNonmetal),
                        ElementView(9, "F", .reactiveNonmetal),
                        ElementView(10, "Ne", .nobleGas),
                        with: rowStyle
                    ),
                    LMRowView(
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        ElementView(),
                        with: rowStyle
                    )
                ),

                LMRowView(
                    KeyView("Alkali metal", .alkaliMetal),
                    KeyView("Alkaline earth metal", .alkalineEarthMetal),
                    KeyView("Lanthanide", .lanthanide),
                    KeyView("Actinide", .actinide),
                    KeyView("Transition metal", .transitionMetal),
                    KeyView("Post-transition metal", .postTransitionMetal),
                    KeyView("Metalloid", .metalloid),
                    KeyView("Reactive nonmetal", .reactiveNonmetal),
                    KeyView("Noble gas", .nobleGas),
                    KeyView("Unknown", .unknown)
                )
            )
        )
    }
}
