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

class ControlsViewController: UITableViewController {
    var sections: [[UITableViewCell]]!

    var segmentedControl: UISegmentedControl!
    var stepper: UIStepper!
    var slider: UISlider!
    var pageControl: UIPageControl!
    var progressView: UIProgressView!

    override func loadView() {
        super.loadView()

        sections = [
            [
                LMTableViewCell(
                    UIButton(type: .system, primaryAction: UIAction(title: "Button") { [unowned self] action in
                        showGreeting()
                    })
                )
            ],
            [
                LMTableViewCell(
                    UITextField(placeholder: "Text")
                ),
                LMTableViewCell(
                    UITextField(placeholder: "Number", keyboardType: .numberPad)
                ),
                LMTableViewCell(
                    UITextField(placeholder: "Email Address", keyboardType: .emailAddress)
                ),
                LMTableViewCell(
                    UITextField(placeholder: "Password", isSecureTextEntry: true)
                ),
                LMTableViewCell(
                    UITextView(height: 90) { textView in
                        textView.textContainer.lineFragmentPadding = 0

                        textView.text = "This is a multi-line text view."
                    }
                )
            ],
            [
                UITableViewCell(style: .default, text: "On/Off", selectionStyle: .none) { tableViewCell in
                    tableViewCell.accessoryView = UISwitch()
                },
                LMTableViewCell(
                    UISegmentedControl(items: [
                        "One", "Two", "Three", "Four"
                    ], primaryAction: UIAction() { [unowned self] _ in
                        segmentedControlValueChanged()
                    }) {
                        segmentedControl = $0
                    }
                ),
                LMTableViewCell(
                    UIDatePicker(datePickerMode: .dateAndTime)
                )
            ],
            [
                LMTableViewCell(
                    LMRowView(
                        LMSpacer(),
                        UIStepper(primaryAction: UIAction() { [unowned self] action in
                            stepperValueChanged()
                        }, minimumValue: 0.0, maximumValue: 1.0, stepValue: 0.1) {
                            stepper = $0
                        },
                        LMSpacer()
                    )
                ),
                LMTableViewCell(
                    UISlider(primaryAction: UIAction() { [unowned self] action in
                        sliderValueChanged()
                    }) {
                        slider = $0
                    }
                ),
                LMTableViewCell(
                    UIPageControl(pageIndicatorTintColor: .lightGray,
                        currentPageIndicatorTintColor: .black) { pageControl in
                        pageControl.numberOfPages = 11

                        self.pageControl = pageControl
                    }
                ),
                LMTableViewCell(
                    LMColumnView(topMargin: 8, bottomMargin: 8,
                        UIProgressView() {
                            progressView = $0
                        }
                    )
                )
            ]
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(primaryAction: UIAction(title: "Item") { [unowned self] action in
            showGreeting()
        })
        
        tableView.allowsSelection = false
               
        slider.minimumValue = Float(stepper.minimumValue)
        slider.maximumValue = Float(stepper.maximumValue)

        stepper.value = 0.5

        stepperValueChanged()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sections[indexPath.section][indexPath.row]
    }

    func showGreeting() {
        let alertController = UIAlertController(title: nil, message: "Hello!", preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .default))

        present(alertController, animated: true)
    }
    
    func segmentedControlValueChanged() {
        let text = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)
        
        let alertController = UIAlertController(title: nil, message: text, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .default))

        present(alertController, animated: true)
    }

    func stepperValueChanged() {
        slider.value = Float(stepper.value)

        updateState()
    }

    func sliderValueChanged() {
        stepper.value = Double(slider.value)

        updateState()
    }

    func updateState() {
        let value = slider.value

        pageControl.currentPage = Int(round(value * 10))
        progressView.progress = value
    }
}
