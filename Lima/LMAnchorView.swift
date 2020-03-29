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

public extension LMAnchorView {
    convenience init(margin: CGFloat? = nil,
        topMargin: CGFloat? = nil,
        leadingMargin: CGFloat? = nil,
        bottomMargin: CGFloat? = nil,
        trailingMargin: CGFloat? = nil,
        backgroundColor: UIColor? = nil,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        _ subviews: UIView...,
        with: ((LMAnchorView) -> Void)? = nil) {
        self.init(margin: margin,
            topMargin: topMargin,
            leadingMargin: leadingMargin,
            bottomMargin: bottomMargin,
            trailingMargin: trailingMargin)

        self.backgroundColor = backgroundColor

        self.weight = weight
        self.anchor = anchor

        for view in subviews {
            addSubview(view)
        }

        with?(self)
    }
}
