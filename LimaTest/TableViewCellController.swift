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

class TableViewCellController: UITableViewController {
    let pharmacyCellIdentifier = "pharmacyCell"
    
    let phoneNumberFormatter = PhoneNumberFormatter()
    
    lazy var dataSource = UITableViewDiffableDataSource<Int, Pharmacy>(tableView: tableView) { (tableView, indexPath, pharmacy) -> UITableViewCell? in
        let cell = tableView.dequeueReusableCell(withIdentifier: self.pharmacyCellIdentifier, for: indexPath) as! PharmacyCell

        cell.nameLabel.text = pharmacy.name
        cell.addressLabel.text = String(format: "%@\n%@ %@ %@", pharmacy.street, pharmacy.city, pharmacy.state, pharmacy.zipCode)
        cell.phoneLabel.text = self.phoneNumberFormatter.string(for: pharmacy.phone)
        cell.faxLabel.text = self.phoneNumberFormatter.string(for: pharmacy.fax)
        cell.emailLabel.text = pharmacy.email
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(PharmacyCell.self, forCellReuseIdentifier: pharmacyCellIdentifier)

        tableView.dataSource = dataSource

        let jsonDecoder = JSONDecoder()

        guard let url = Bundle.main.url(forResource: "pharmacies", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let pharmacies = try? jsonDecoder.decode([Pharmacy].self, from: data) else {
            fatalError()
        }

        var snapshot = NSDiffableDataSourceSnapshot<Int, Pharmacy>()
        
        snapshot.appendSections([0])
        snapshot.appendItems(pharmacies)

        dataSource.apply(snapshot, animatingDifferences: false)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

struct Pharmacy: Hashable, Decodable {
    let name: String
    let street: String
    let city: String
    let state: String
    let zipCode: String
    let phone: String
    let fax: String
    let email: String
}

class PharmacyCell: LMTableViewCell {
    var nameLabel: UILabel!
    var addressLabel: UILabel!
    var phoneLabel: UILabel!
    var faxLabel: UILabel!
    var emailLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setContent(LMColumnView(spacing: 4,
            UILabel(font: .preferredFont(forTextStyle: .headline), weight: 1) { nameLabel = $0 },
            UILabel(font: .preferredFont(forTextStyle: .body), numberOfLines: 0) { addressLabel = $0 },

            LMColumnView(spacing: 4, isAlignToGrid: true,
                LMRowView(
                    UIImageView(image: UIImage(systemName: "phone.fill"), contentMode: .scaleAspectFit, tintColor: .darkGray),
                    UILabel(font: .preferredFont(forTextStyle: .caption1), weight: 1) { phoneLabel = $0 }
                ),

                LMRowView(
                    UIImageView(image: UIImage(systemName: "printer.fill"), contentMode: .scaleAspectFit, tintColor: .darkGray),
                    UILabel(font: .preferredFont(forTextStyle: .caption1), weight: 1) { faxLabel = $0 }
                ),

                LMRowView(
                    UIImageView(image: UIImage(systemName: "envelope.fill"), contentMode: .scaleAspectFit, tintColor: .darkGray),
                    UILabel(font: .preferredFont(forTextStyle: .caption1), weight: 1) { emailLabel = $0 }
                )
            )
        ), ignoreMargins: false)
    }

    required init?(coder decoder: NSCoder) {
        return nil
    }
}

class PhoneNumberFormatter: Formatter {
    override func string(for object: Any?) -> String? {
        guard let value = object as? NSString else {
            return nil
        }

        return String(format: "(%@) %@-%@",
            value.substring(with: NSMakeRange(0, 3)),
            value.substring(with: NSMakeRange(3, 3)),
            value.substring(with: NSMakeRange(6, 4))
        )
    }
}
