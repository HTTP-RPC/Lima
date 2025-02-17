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

class ViewController: UITableViewController {
    enum Example: Int, CaseIterable {
        case greeting
        case horizontalAlignment
        case verticalAlignment
        case baselineAlignment
        case gridAlignment
        case anchorView
        case displayable
        case hitTest
        case periodicTable
        case tableViewCell
        case controls
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lima Test"

        navigationItem.backButtonDisplayMode = .minimal
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Example.allCases.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let example = Example(rawValue: indexPath.row) else {
            fatalError()
        }

        let cellIdentifier = "cell"

        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)

        switch example {
        case .greeting:
            cell.textLabel?.text = "Greeting"

        case .horizontalAlignment:
            cell.textLabel?.text = "Horizontal Alignment"

        case .verticalAlignment:
            cell.textLabel?.text = "Vertical Alignment"

        case .baselineAlignment:
            cell.textLabel?.text = "Baseline Alignment"

        case .gridAlignment:
            cell.textLabel?.text = "Grid Alignment"

        case .anchorView:
            cell.textLabel?.text = "Anchor View"

        case .displayable:
            cell.textLabel?.text = "Displayable"

        case .hitTest:
            cell.textLabel?.text = "Hit Test"

        case .periodicTable:
            cell.textLabel?.text = "Periodic Table"

        case .tableViewCell:
            cell.textLabel?.text = "Table View Cell"

        case .controls:
            cell.textLabel?.text = "Controls"
        }

        cell.accessoryType = .disclosureIndicator

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let example = Example(rawValue: indexPath.row) else {
            fatalError()
        }

        let viewController: UIViewController
        switch example {
        case .greeting:
            viewController = GreetingViewController()
            
        case .horizontalAlignment:
            viewController = HorizontalAlignmentViewController()

        case .verticalAlignment:
            viewController = VerticalAlignmentViewController()

        case .baselineAlignment:
            viewController = BaselineAlignmentViewController()

        case .gridAlignment:
            viewController = GridAlignmentViewController()

        case .anchorView:
            viewController = AnchorViewController()

        case .displayable:
            viewController = DisplayableViewController()

        case .hitTest:
            viewController = HitTestViewController()

        case .periodicTable:
            viewController = PeriodicTableViewController()

        case .tableViewCell:
            viewController = TableViewCellController()

        case .controls:
            viewController = ControlsViewController(style: .insetGrouped)
        }

        viewController.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
        
        navigationController?.pushViewController(viewController, animated: true)
    }

    override func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

