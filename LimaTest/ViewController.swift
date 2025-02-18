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
        case controls
        case tableViewCell
        case action
        case hitTest
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

        let text = switch example {
            case .greeting: "Greeting"
            case .horizontalAlignment: "Horizontal Alignment"
            case .verticalAlignment: "Vertical Alignment"
            case .baselineAlignment: "Baseline Alignment"
            case .gridAlignment: "Grid Alignment"
            case .anchorView: "Anchor View"
            case .controls: "Controls"
            case .tableViewCell: "Table View Cell"
            case .action: "Action"
            case .hitTest: "Hit Test"
        }

        cell.textLabel?.text = text
        
        cell.accessoryType = .disclosureIndicator

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let example = Example(rawValue: indexPath.row) else {
            fatalError()
        }

        let viewController = switch example {
            case .greeting: GreetingViewController()
            case .horizontalAlignment: HorizontalAlignmentViewController()
            case .verticalAlignment: VerticalAlignmentViewController()
            case .baselineAlignment: BaselineAlignmentViewController()
            case .gridAlignment: GridAlignmentViewController()
            case .anchorView: AnchorViewController()
            case .controls: ControlsViewController(style: .insetGrouped)
            case .tableViewCell: TableViewCellController()
            case .action: ActionViewController()
            case .hitTest: HitTestViewController()
        }

        viewController.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
        
        navigationController?.pushViewController(viewController, animated: true)
    }

    override func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

