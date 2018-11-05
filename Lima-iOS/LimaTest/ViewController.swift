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
        #if os(iOS)
        case controls
        #endif
        case horizontalAlignment
        case verticalAlignment
        case anchorView
        case gridView
        #if os(iOS)
        case scrollView
        case periodicTable
        #endif
        case tableViewCell
        #if os(iOS)
        case collectionViewCell
        case webView
        case mapView
        case animation
        #endif
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Lima Test"

        #if os(iOS)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        #endif
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
        #if os(iOS)
        case .controls:
            cell.textLabel?.text = "Controls"
        #endif

        case .horizontalAlignment:
            cell.textLabel?.text = "Horizontal Alignment"

        case .verticalAlignment:
            cell.textLabel?.text = "Vertical Alignment"

        case .anchorView:
            cell.textLabel?.text = "Anchor View"

        case .gridView:
            cell.textLabel?.text = "Grid View"

        #if os(iOS)
        case .scrollView:
            cell.textLabel?.text = "Scroll View"

        case .periodicTable:
            cell.textLabel?.text = "Periodic Table"
        #endif

        case .tableViewCell:
            cell.textLabel?.text = "Table View Cell"

        #if os(iOS)
        case .collectionViewCell:
            cell.textLabel?.text = "Collection View Cell"

        case .webView:
            cell.textLabel?.text = "Web View"

        case .mapView:
            cell.textLabel?.text = "Map View"

        case .animation:
            cell.textLabel?.text = "Animation"
        #endif
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
        #if os(iOS)
        case .controls:
            viewController = ControlsViewController(style: .grouped)
        #endif
            
        case .horizontalAlignment:
            viewController = HorizontalAlignmentViewController()

        case .verticalAlignment:
            viewController = VerticalAlignmentViewController()

        case .anchorView:
            viewController = AnchorViewController()

        case .gridView:
            viewController = GridViewController()

        #if os(iOS)
        case .scrollView:
            viewController = ScrollViewController()

        case .periodicTable:
            viewController = PeriodicTableViewController()
        #endif

        case .tableViewCell:
            viewController = TableViewCellController()

        #if os(iOS)
        case .collectionViewCell:
            let collectionViewLayout = UICollectionViewFlowLayout()

            collectionViewLayout.itemSize = CGSize(width: 80, height: 120)
            collectionViewLayout.sectionInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

            viewController = CollectionViewCellController(collectionViewLayout: collectionViewLayout)

        case .webView:
            viewController = WebViewController()

        case .mapView:
            viewController = MapViewController()

        case .animation:
            viewController = AnimationViewController()
        #endif
        }

        viewController.title = tableView.cellForRow(at: indexPath)?.textLabel?.text
        viewController.edgesForExtendedLayout = UIRectEdge()
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    override func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

