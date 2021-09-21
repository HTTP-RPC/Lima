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
        Element(name: "Black", color: .black),
        Element(name: "Dark Gray", color: .darkGray),
        Element(name: "Light Gray", color: .lightGray),
        Element(name: "White", color: .white),
        Element(name: "Gray", color: .gray),
        Element(name: "Red", color: .red),
        Element(name: "Green", color: .green),
        Element(name: "Blue", color: .blue),
        Element(name: "Cyan", color: .cyan),
        Element(name: "Yellow", color: .yellow),
        Element(name: "Magenta", color: .magenta),
        Element(name: "Orange", color: .orange),
        Element(name: "Purple", color: .purple),
        Element(name: "Brown", color: .brown),
        Element(name: "Clear", color: .clear),
        Element(name: "None", color: nil)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.backgroundColor = .white

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

        setContent(LMColumnView(
            UILabel(textAlignment: .center, font: UIFont.preferredFont(forTextStyle: .caption1)) { self.nameLabel = $0 }
        ) { columnView in
            let colorSwatch = UIView()

            colorSwatch.weight = 1

            columnView.addSubview(colorSwatch)

            self.colorSwatch = colorSwatch
        }, ignoreMargins: false)
    }

    required init?(coder decoder: NSCoder) {
        return nil
    }
}
