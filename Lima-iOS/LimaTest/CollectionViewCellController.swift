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
    let colors = [
        "#ffffff", "#c0c0c0", "#808080", "#000000",
        "#ff0000", "#800000", "#ffff00", "#808080",
        "#00ff00", "#008000", "#00ffff", "#008080",
        "#0000ff", "#000080", "#ff00ff", "#800080"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(ColorCell.self, forCellWithReuseIdentifier: ColorCell.description())
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ColorCell.description(), for: indexPath) as? ColorCell else {
            fatalError()
        }

        // TODO
        
        return cell
    }
}

class ColorCell: LMCollectionViewCell {
    // TODO
}
