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

class CollectionViewCellController: UICollectionViewController {
    struct Element {
        let name: String
        let color: UIColor?
    }

    let elements: [Element] = [
        Element(name: "Black", color: UIColor.black),
        Element(name: "Dark Gray", color: UIColor.darkGray),
        Element(name: "Light Gray", color: UIColor.lightGray),
        Element(name: "White", color: UIColor.white),
        Element(name: "Gray", color: UIColor.gray),
        Element(name: "Red", color: UIColor.red),
        Element(name: "Green", color: UIColor.green),
        Element(name: "Blue", color: UIColor.blue),
        Element(name: "Cyan", color: UIColor.cyan),
        Element(name: "Yellow", color: UIColor.yellow),
        Element(name: "Magenta", color: UIColor.magenta),
        Element(name: "Orange", color: UIColor.orange),
        Element(name: "Purple", color: UIColor.purple),
        Element(name: "Brown", color: UIColor.brown),
        Element(name: "Clear", color: UIColor.clear),
        Element(name: "None", color: nil)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.backgroundColor = UIColor.white

        collectionView?.register(ColorCell.self, forCellWithReuseIdentifier: ColorCell.description())
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elements.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.description(), for: indexPath) as? ColorCell else {
            fatalError()
        }

        let element = elements[indexPath.item]

        cell.name = element.name
        cell.color = element.color
        
        return cell
    }
}

class ColorCell: LMCollectionViewCell {
    var nameLabel: UILabel!
    var colorSwatch: UIView!

    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }

    var color: UIColor? {
        didSet {
            colorSwatch.backgroundColor = color
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor(0xeeeeee, alpha: 0.9)
        selectedBackgroundView?.layer.cornerRadius = 8

        content = LMColumnView(
            UILabel(textAlignment: .center, font: UIFont.preferredFont(forTextStyle: .caption1)) { self.nameLabel = $0 }
        ) { columnView in
            let colorSwatch = UIView()

            colorSwatch.weight = 1

            columnView.addSubview(colorSwatch)

            self.colorSwatch = colorSwatch
        }
    }

    required init?(coder decoder: NSCoder) {
        return nil
    }
}
