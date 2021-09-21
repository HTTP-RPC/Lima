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
    var pharmacies: [Pharmacy]?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 2
        tableView.register(PharmacyCell.self, forCellReuseIdentifier: PharmacyCell.description())

        let jsonDecoder = JSONDecoder()

        guard let url = Bundle.main.url(forResource: "pharmacies", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
            fatalError()
        }

        pharmacies = try? jsonDecoder.decode([Pharmacy].self, from: data)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacies?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PharmacyCell.description(), for: indexPath) as! PharmacyCell

        cell.pharmacy = pharmacies?[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

struct Pharmacy: Decodable {
    let name: String

    let street: String
    let city: String
    let state: String
    let zipCode: String

    var address: String {
        return String(format: "%@\n%@ %@ %@", street, city, state, zipCode)
    }

    let phone: String
    let fax: String
    let email: String
    let distance: Double
}

class PharmacyCell: LMTableViewCell {
    var nameLabel: UILabel!
    var distanceLabel: UILabel!
    var addressLabel: UILabel!
    var phoneLabel: UILabel!
    var faxLabel: UILabel!
    var emailLabel: UILabel!

    let distanceFormatter = MeasurementFormatter()
    let phoneNumberFormatter = PhoneNumberFormatter();

    var pharmacy: Pharmacy! {
        didSet {
            nameLabel.text = pharmacy.name
            distanceLabel.text = distanceFormatter.string(for: Measurement(value: pharmacy.distance, unit: UnitLength.miles))
            addressLabel.text = pharmacy.address
            phoneLabel.text = phoneNumberFormatter.string(for: pharmacy.phone)
            faxLabel.text = phoneNumberFormatter.string(for: pharmacy.fax)
            emailLabel.text = pharmacy.email
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setContent(LMColumnView(spacing: 4,
            LMRowView(spacing: 4, isAlignToBaseline: true,
                UILabel(font: .preferredFont(forTextStyle: .headline), weight: 1) { self.nameLabel = $0 },
                UILabel(textColor: .gray, font: .preferredFont(forTextStyle: .body)) { self.distanceLabel = $0 }
            ),

            UILabel(font: .preferredFont(forTextStyle: .body), numberOfLines: 0) { self.addressLabel = $0 },

            LMColumnView(spacing: 4,
                LMRowView(
                    UIImageView(image: UIImage(systemName: "phone.fill"), tintColor: .darkGray),
                    UILabel(font: .preferredFont(forTextStyle: .caption1), weight: 1) { self.phoneLabel = $0 }
                ),

                LMRowView(
                    UIImageView(image: UIImage(systemName: "printer.fill"), tintColor: .darkGray),
                    UILabel(font: .preferredFont(forTextStyle: .caption1), weight: 1) { self.faxLabel = $0 }
                ),

                LMRowView(
                    UIImageView(image: UIImage(systemName: "envelope.fill"), tintColor: .darkGray),
                    UILabel(font: .preferredFont(forTextStyle: .caption1), weight: 1) { self.emailLabel = $0 }
                )
            )
        ), ignoreMargins: false)

        distanceFormatter.unitStyle = .long
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
