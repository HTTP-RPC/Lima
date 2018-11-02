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

class ViewController: UITableViewController {
    enum Example: Int, CaseIterable {
        case controls
        case horizontalAlignment
        case verticalAlignment
        case anchorView
        case gridView
        case scrollView
        case tableViewCell
        case collectionViewCell
        case webView
        case mapView
        case animation
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lima Test"

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
        case .controls:
            cell.textLabel?.text = "Controls"

        case .horizontalAlignment:
            cell.textLabel?.text = "Horizontal Alignment"

        case .verticalAlignment:
            cell.textLabel?.text = "Vertical Alignment"

        case .anchorView:
            cell.textLabel?.text = "Anchor View"

        case .gridView:
            cell.textLabel?.text = "Grid View"

        case .scrollView:
            cell.textLabel?.text = "Scroll View"

        case .tableViewCell:
            cell.textLabel?.text = "Table View Cell"

        case .collectionViewCell:
            cell.textLabel?.text = "Collection View Cell"

        case .webView:
            cell.textLabel?.text = "Web View"

        case .mapView:
            cell.textLabel?.text = "Map View"

        case .animation:
            cell.textLabel?.text = "Animation"
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
        case .controls:
            viewController = ControlsViewController()
            
        case .horizontalAlignment:
            viewController = HorizontalAlignmentViewController()

        case .verticalAlignment:
            viewController = VerticalAlignmentViewController()

        case .anchorView:
            viewController = AnchorViewController()

        case .gridView:
            viewController = GridViewController()

        case .scrollView:
            viewController = ScrollViewController()

        case .tableViewCell:
            viewController = TableViewCellController()

        case .collectionViewCell:
            viewController = CollectionViewCellController()

        case .webView:
            viewController = WebViewController()

        case .mapView:
            viewController = MapViewController()

        case .animation:
            viewController = AnimationViewController()
        }

        viewController.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
        viewController.edgesForExtendedLayout = UIRectEdge()
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

