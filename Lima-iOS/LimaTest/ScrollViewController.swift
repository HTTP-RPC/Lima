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

class ScrollViewController: UIViewController {
    var label1: UILabel!
    var label2: UILabel!

    let dispatchQueue = DispatchQueue(label: "Dispatch Queue")

    override func loadView() {
        view = LMAnchorView(margin: 0, backgroundColor: UIColor.white,
            LMScrollView(isFitToWidth: true, anchor: [.all],
                LMColumnView(margin: 10, spacing: 10,
                    UILabel(numberOfLines: 0, lineBreakMode: .byWordWrapping) { self.label1 = $0 },
                    UILabel(numberOfLines: 0, lineBreakMode: .byWordWrapping) { self.label2 = $0 }
                )
            ) { scrollView in
                let refreshControl = UIRefreshControl()

                refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)

                scrollView.refreshControl = refreshControl
            },

            LMColumnView(margin: 20, anchor: [.bottom, .left, .right],
                UIButton(type: .system, title: "Press Me!") { button in
                    button.backgroundColor = UIColor(0xffffff, alpha: 0.9)
                    button.contentEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

                    button.layer.borderWidth = 0.5
                    button.layer.borderColor = UIColor.gray.cgColor
                    button.layer.cornerRadius = 6

                    button.addTarget(self, action: #selector(self.showGreeting), for: .primaryActionTriggered)
                }
            )
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        viewRespectsSystemMinimumLayoutMargins = false

        guard let textPath = Bundle.main.path(forResource: "sample", ofType: "txt"),
            let text = try? String(contentsOfFile: textPath, encoding: String.Encoding.ascii) else {
            fatalError()
        }

        label1.text = text
        label2.text = text
    }

    @objc func showGreeting() {
        let alertController = UIAlertController(title: "Greeting", message: "Hello!", preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .default))

        present(alertController, animated: true)
    }

    @objc func refresh(_ sender: UIRefreshControl) {
        dispatchQueue.async {
            Thread.sleep(forTimeInterval: 2)

            OperationQueue.main.addOperation() {
                sender.endRefreshing()
            }
        }
    }
}
