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
import WebKit
import Lima

class WebViewController: UIViewController, UITextFieldDelegate {
    var webView: WKWebView!
    var urlTextField: UITextField!

    override func loadView() {
        webView = WKWebView()

        webView.weight = 1
        webView.layer.borderWidth = 0.5
        webView.layer.borderColor = UIColor.lightGray.cgColor

        view = LMColumnView(margin: 16, backgroundColor: UIColor.white,
            webView,
            UITextField(borderStyle: .roundedRect,
                keyboardType: .URL,
                autocorrectionType: .no,
                autocapitalizationType: .none) { self.urlTextField = $0 },
            UIButton(type: .system, title: "Go") { button in
                button.addTarget(self, action: #selector(self.loadURL), for: .primaryActionTriggered)
            }
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        urlTextField.text = "http://"

        urlTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let defaultNotificationCenter = NotificationCenter.default

        defaultNotificationCenter.addObserver(self, selector: #selector(keyboardWillShow(_:)),
            name: UIResponder.keyboardWillShowNotification, object: nil)
        defaultNotificationCenter.addObserver(self, selector: #selector(keyboardWillHide(_:)),
            name: UIResponder.keyboardWillHideNotification, object: nil)

        urlTextField.becomeFirstResponder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        NotificationCenter.default.removeObserver(self)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        loadURL()

        return false
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        let frame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect

        // TODO view.bottomMargin = frame.height
    }

    @objc func keyboardWillHide(_ notification: Notification) {
        // TODO view.bottomPadding = 0
    }

    @objc func loadURL() {
        webView.load(URLRequest(url: URL(string: urlTextField.text!)!))
    }
}
