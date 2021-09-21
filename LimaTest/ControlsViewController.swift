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
    struct Section {
        let heading: String
        let cells: [UITableViewCell]
    }

    var sections: [Section]!

    var stepper: UIStepper!
    var slider: UISlider!
    var pageControl: UIPageControl!
    var progressView: UIProgressView!

    override func loadView() {
        super.loadView()

        sections = [
            // Button
            Section(heading: "Button", cells: [
                LMTableViewCell(selectionStyle: .none,
                    UIButton(type: .system, primaryAction: UIAction(title: "Button") { [unowned self] action in
                        buttonPressed()
                    })
                )
            ]),

            // Text fields
            Section(heading: "Text Fields", cells: [
                LMTableViewCell(selectionStyle: .none,
                    UITextField(placeholder: "Text")
                ),
                LMTableViewCell(selectionStyle: .none,
                    UITextField(placeholder: "Number", keyboardType: .numberPad)
                ),
                LMTableViewCell(selectionStyle: .none,
                    UITextField(placeholder: "Email Address", keyboardType: .emailAddress)
                ),
                LMTableViewCell(selectionStyle: .none,
                    UITextField(placeholder: "Password", isSecureTextEntry: true)
                )
            ]),

            // Switch
            Section(heading: "Switch", cells: [
                UITableViewCell(style: .default, text: "On/Off", selectionStyle: .none) { tableViewCell in
                    tableViewCell.accessoryView = UISwitch()
                }
            ]),

            // Segmented control
            Section(heading: "Segmented Control", cells: [
                // TODO Use actions
                LMTableViewCell(selectionStyle: .none,
                    LMRowView(
                        LMSpacer(),
                        UISegmentedControl() { segmentedControl in
                            segmentedControl.insertSegment(withTitle: "One", at: 0, animated: false)
                            segmentedControl.insertSegment(withTitle: "Two", at: 1, animated: false)
                            segmentedControl.insertSegment(withTitle: "Three", at: 2, animated: false)
                            segmentedControl.insertSegment(withTitle: "Four", at: 3, animated: false)
                        },
                        LMSpacer()
                    )
                )
            ]),

            // Date picker
            Section(heading: "Date Picker", cells: [
                LMTableViewCell(selectionStyle: .none,
                    UIDatePicker(datePickerMode: .dateAndTime) { datePicker in
                        datePicker.preferredDatePickerStyle = .inline
                    }
                )
            ]),

            // Stepper
            Section(heading: "Stepper", cells: [
                LMTableViewCell(selectionStyle: .none,
                    LMRowView(
                        LMSpacer(),
                        UIStepper(minimumValue: 0.0, maximumValue: 1.0, stepValue: 0.1) { stepper in
                            stepper.value = 0.5
                            stepper.on(.valueChanged) { [unowned self] sender in
                                stepperValueChanged(sender)
                            }

                            self.stepper = stepper
                        },
                        LMSpacer()
                    )
                )
            ]),

            // Slider
            Section(heading: "Slider", cells: [
                LMTableViewCell(selectionStyle: .none,
                    UISlider() { slider in
                        slider.on(.valueChanged) { [unowned self] sender in
                            sliderValueChanged(sender)
                        }

                        self.slider = slider
                    }
                )
            ]),

            // Page control
            Section(heading: "Page Control", cells: [
                LMTableViewCell(selectionStyle: .none,
                    UIPageControl(pageIndicatorTintColor: .lightGray,
                        currentPageIndicatorTintColor: .black) { pageControl in
                        pageControl.numberOfPages = 11

                        self.pageControl = pageControl
                    }
                )
            ]),

            // Progress view
            Section(heading: "Progress View", cells: [
                LMTableViewCell(selectionStyle: .none,
                    LMColumnView(topMargin: 8, bottomMargin: 8,
                        UIProgressView() { progressView in
                            self.progressView = progressView
                        }
                    )
                )
            ])
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Item") { [unowned self] sender in
            barButtonItemPressed(sender)
        }
               
        slider.minimumValue = Float(stepper.minimumValue)
        slider.maximumValue = Float(stepper.maximumValue)

        stepperValueChanged(stepper)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cells.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].heading
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return sections[indexPath.section].cells[indexPath.row]
    }
    
    func barButtonItemPressed(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: sender.title, message: "Hello!", preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .default))

        present(alertController, animated: true)
    }

    func buttonPressed() {
        let alertController = UIAlertController(title: nil, message: "Hello!", preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .default))

        present(alertController, animated: true)
    }

    func stepperValueChanged(_ sender: UIStepper) {
        slider.value = Float(sender.value)

        updateState()
    }

    func sliderValueChanged(_ sender: UISlider) {
        stepper.value = Double(sender.value)

        updateState()
    }

    func updateState() {
        let value = slider.value

        pageControl.currentPage = Int(round(value * 10))
        progressView.progress = value
    }
}
