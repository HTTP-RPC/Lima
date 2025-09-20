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
    let flagCellIdentifier = "flagCell"

    let flags = [
        Flag(flagImageName: "alpha", name: "Alpha", description: "I have a diver down; keep well clear at slow speed."),
        Flag(flagImageName: "bravo", name: "Bravo", description: "I am taking in or discharging or carrying dangerous goods."),
        Flag(flagImageName: "charlie", name: "Charlie", description: "Affirmative."),
        Flag(flagImageName: "delta", name: "Delta", description: "Keep clear of me; I am maneuvering with difficulty."),
        Flag(flagImageName: "echo", name: "Echo", description: "I am altering my course to starboard."),
        Flag(flagImageName: "foxtrot", name: "Foxtrot", description: "I am disabled; communicate with me."),
        Flag(flagImageName: "golf", name: "Golf", description: "I require a pilot."),
        Flag(flagImageName: "hotel", name: "Hotel", description: "I have a pilot on board."),
        Flag(flagImageName: "india", name: "India", description: "I am altering my course to port."),
        Flag(flagImageName: "juliet", name: "Juliet", description: "I am leaking dangerous cargo."),
        Flag(flagImageName: "kilo", name: "Kilo", description: "I wish to communicate with you."),
        Flag(flagImageName: "lima", name: "Lima", description: "You should stop your vessel instantly."),
        Flag(flagImageName: "mike", name: "Mike", description: "My vessel is stopped and making no way through the water."),
        Flag(flagImageName: "november", name: "November", description: "Negative."),
        Flag(flagImageName: "oscar", name: "Oscar", description: "Man overboard."),
        Flag(flagImageName: "papa", name: "Papa", description: "My nets have come fast upon an obstruction."),
        Flag(flagImageName: "quebec", name: "Quebec", description: "My vessel is \"healthy\" and I request free pratique."),
        Flag(flagImageName: "romeo", name: "Romeo", description: "No ICS meaning as single flag."),
        Flag(flagImageName: "sierra", name: "Sierra", description: "I am operating astern propulsion."),
        Flag(flagImageName: "tango", name: "Tango", description: "Keep clear of me."),
        Flag(flagImageName: "uniform", name: "Uniform", description: "You are running into danger."),
        Flag(flagImageName: "victor", name: "Victor", description: "I require assistance."),
        Flag(flagImageName: "whisky", name: "Whiskey", description: "I require medical assistance."),
        Flag(flagImageName: "xray", name: "Xray", description: "Stop carrying out your intentions and watch for my signals."),
        Flag(flagImageName: "yankee", name: "Yankee", description: "I am dragging my anchor."),
        Flag(flagImageName: "zulu", name: "Zulu", description: "I require a tug.")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(FlagCell.self, forCellReuseIdentifier: flagCellIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: flagCellIdentifier, for: indexPath) as! FlagCell

        let flag = flags[indexPath.row]

        cell.flagImageView.image = UIImage(named: "flags/\(flag.flagImageName)")

        cell.nameLabel.text = flag.name
        cell.descriptionLabel.text = flag.description

        return cell
    }
}

struct Flag {
    let flagImageName: String

    let name: String
    let description: String
}

class FlagCell: LMTableViewCell {
    var flagImageView: UIImageView!

    var nameLabel: UILabel!
    var descriptionLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setContent(LMRowView(spacing: 8) {
            UIImageView(contentMode: .top, width: 60) {
                flagImageView = $0
            }

            LMColumnView(spacing: 2) {
                UILabel(font: .preferredFont(forTextStyle: .headline)) {
                    nameLabel = $0
                }

                UILabel(font: .preferredFont(forTextStyle: .body), numberOfLines: 0) {
                    descriptionLabel = $0
                }

                LMSpacer()
            }
        }, ignoreMargins: false)
    }

    required init?(coder decoder: NSCoder) {
        return nil
    }
}
