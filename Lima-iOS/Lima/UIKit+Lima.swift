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

public extension UIColor {
    convenience init(_ rgb: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat((rgb >> 16) & 0xff) / 255.0,
            green: CGFloat((rgb >> 8) & 0xff) / 255.0,
            blue: CGFloat(rgb & 0xff) / 255.0,
            alpha: alpha)
    }
}

public extension UIView {
    var topMargin: CGFloat {
        get {
            return directionalLayoutMargins.top
        }

        set {
            var margins = directionalLayoutMargins

            margins.top = newValue

            directionalLayoutMargins = margins
        }
    }

    var leadingMargin: CGFloat {
        get {
            return directionalLayoutMargins.leading
        }

        set {
            var margins = directionalLayoutMargins

            margins.leading = newValue

            directionalLayoutMargins = margins
        }
    }

    var bottomMargin: CGFloat {
        get {
            return directionalLayoutMargins.bottom
        }

        set {
            var margins = directionalLayoutMargins

            margins.bottom = newValue

            directionalLayoutMargins = margins
        }
    }

    var trailingMargin: CGFloat {
        get {
            return directionalLayoutMargins.trailing
        }

        set {
            var margins = directionalLayoutMargins

            margins.trailing = newValue

            directionalLayoutMargins = margins
        }
    }
}

public extension UILabel {
    convenience init(text: String? = nil,
        textAlignment: NSTextAlignment = .natural, textColor: UIColor? = nil, font: UIFont? = nil,
        numberOfLines: Int = 1,
        lineBreakMode: NSLineBreakMode = .byTruncatingTail,
        width: CGFloat = .nan,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UILabel) -> Void)? = nil) {
        self.init()

        self.text = text
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = font
        self.numberOfLines = numberOfLines

        self.width = width
        self.weight = weight
        self.anchor = anchor

        with?(self)
    }
}

public extension UIImageView {
    convenience init(image: UIImage? = nil,
        contentMode: UIControl.ContentMode = .scaleToFill,
        tintColor: UIColor? = nil,
        width: CGFloat = .nan, height: CGFloat = .nan,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UIImageView) -> Void)? = nil) {
        self.init()

        self.image = image
        self.contentMode = contentMode
        self.tintColor = tintColor

        self.width = width
        self.height = height
        self.weight = weight
        self.anchor = anchor

        with?(self)
    }
}

public extension UIButton {
    convenience init(type: UIButton.ButtonType,
        title: String? = nil, image: UIImage? = nil,
        tintColor: UIColor? = nil,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UIButton) -> Void)? = nil) {
        self.init(type: type)

        setTitle(title, for: .normal)
        setImage(image, for: .normal)

        self.tintColor = tintColor

        self.weight = weight
        self.anchor = anchor

        with?(self)
    }
}

public extension UITextField {
    convenience init(placeholder: String? = nil,
        textAlignment: NSTextAlignment = .natural, textColor: UIColor? = nil, font: UIFont? = nil,
        borderStyle: UITextField.BorderStyle = .none,
        keyboardType: UIKeyboardType = .default,
        returnKeyType: UIReturnKeyType = .default,
        autocorrectionType: UITextAutocorrectionType = .default,
        autocapitalizationType: UITextAutocapitalizationType = .sentences,
        textContentType: UITextContentType? = nil,
        isSecureTextEntry: Bool = false,
        width: CGFloat = .nan,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UITextField) -> Void)? = nil) {
        self.init()

        self.placeholder = placeholder
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = font
        self.borderStyle = borderStyle
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.autocorrectionType = autocorrectionType
        self.autocapitalizationType = autocapitalizationType
        self.textContentType = textContentType
        self.isSecureTextEntry = isSecureTextEntry

        self.width = width
        self.weight = weight
        self.anchor = anchor

        with?(self)
    }
}

#if os(iOS)
public extension UIDatePicker {
    convenience init(datePickerMode: UIDatePicker.Mode = .dateAndTime,
        height: CGFloat = .nan,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UIDatePicker) -> Void)? = nil) {
        self.init()

        self.datePickerMode = datePickerMode

        self.height = height
        self.weight = weight
        self.anchor = anchor

        with?(self)
    }
}

public extension UISwitch {
    convenience init(tintColor: UIColor? = nil,
        onTintColor: UIColor? = nil,
        with: ((UISwitch) -> Void)? = nil) {
        self.init()

        self.tintColor = tintColor
        self.onTintColor = onTintColor

        with?(self)
    }
}
#endif

public extension UISegmentedControl {
    convenience init(tintColor: UIColor? = nil,
        width: CGFloat = .nan,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UISegmentedControl) -> Void)? = nil) {
        self.init()

        self.tintColor = tintColor

        self.width = width
        self.weight = weight
        self.anchor = anchor

        with?(self)
    }
}

#if os(iOS)
public extension UISlider {
    convenience init(minimumValue: Float = 0.0, maximumValue: Float = 1.0, isContinuous: Bool = true,
        width: CGFloat = .nan,  
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UISlider) -> Void)? = nil) {
        self.init()

        self.minimumValue = minimumValue
        self.maximumValue = maximumValue

        self.isContinuous = isContinuous

        self.width = width
        self.weight = weight
        self.anchor = anchor

        with?(self)
    }
}

public extension UIStepper {
    convenience init(minimumValue: Double = 0.0, maximumValue: Double = 100.0,
        stepValue: Double = 1.0,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UIStepper) -> Void)? = nil) {
        self.init()

        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.stepValue = stepValue

        self.weight = weight
        self.anchor = anchor

        with?(self)
    }
}
#endif

public extension UIPageControl {
    convenience init(pageIndicatorTintColor: UIColor? = nil,
        currentPageIndicatorTintColor: UIColor? = nil,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UIPageControl) -> Void)? = nil) {
        self.init()

        self.pageIndicatorTintColor = pageIndicatorTintColor
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor

        self.weight = weight
        self.anchor = anchor

        with?(self)
    }
}

public extension UIActivityIndicatorView {
    convenience init(style: UIActivityIndicatorView.Style,
        color: UIColor? = nil,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UIActivityIndicatorView) -> Void)? = nil) {
        self.init(style: style)

        self.color = color

        self.weight = weight
        self.anchor = anchor

        with?(self)
    }
}

public extension UIProgressView {
    convenience init(progressTintColor: UIColor? = nil,
        trackTintColor: UIColor? = nil,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UIProgressView) -> Void)? = nil) {
        self.init()

        self.progressTintColor = progressTintColor
        self.trackTintColor = trackTintColor

        self.weight = weight
        self.anchor = anchor

        with?(self)
    }
}

public extension UITextView {
    convenience init(textContainer: NSTextContainer? = nil,
        isEditable: Bool = true, isSelectable: Bool = true,
        textAlignment: NSTextAlignment = .natural, textColor: UIColor? = nil, font: UIFont? = nil,
        width: CGFloat = .nan, height: CGFloat = .nan,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UITextView) -> Void)? = nil) {
        self.init(frame: CGRect(), textContainer: textContainer)

        #if os(iOS)
        self.isEditable = isEditable
        #endif
        
        self.isSelectable = isSelectable
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = font

        self.width = width
        self.height = height
        self.weight = weight
        self.anchor = anchor

        with?(self)
    }
}

public extension UITableView {
    convenience init(style: UITableView.Style = .plain,
        allowsSelection: Bool = true,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UITableView) -> Void)? = nil) {
        self.init(frame: CGRect(), style: style)

        self.allowsSelection = allowsSelection

        self.weight = weight
        self.anchor = anchor

        with?(self)
    }
}

public extension UITableViewCell {
    convenience init(style: UITableViewCell.CellStyle,
        text: String? = nil, detailText: String? = nil,
        accessoryType: UITableViewCell.AccessoryType = .none,
        selectionStyle: UITableViewCell.SelectionStyle = .blue,
        with: ((UITableViewCell) -> Void)? = nil) {
        self.init(style: style, reuseIdentifier: nil)

        textLabel?.text = text
        detailTextLabel?.text = detailText

        self.accessoryType = accessoryType
        self.selectionStyle = selectionStyle

        with?(self)
    }
}

public extension UITableViewHeaderFooterView {
    convenience init(text: String? = nil, detailText: String? = nil,
        with: ((UITableViewHeaderFooterView) -> Void)? = nil) {
        self.init()

        textLabel?.text = text
        detailTextLabel?.text = detailText

        with?(self)
    }
}

public extension UICollectionView {
    convenience init(collectionViewLayout layout: UICollectionViewLayout,
        width: CGFloat = .nan, height: CGFloat = .nan,
        with: ((UICollectionView) -> Void)? = nil) {
        self.init(frame: CGRect(), collectionViewLayout: layout)

        self.width = width
        self.height = height

        backgroundColor = .white

        with?(self)
    }
}

public extension UICollectionViewFlowLayout {
    convenience init(scrollDirection: UICollectionView.ScrollDirection = .vertical,
        itemSize: CGSize = CGSize(),
        minimumInteritemSpacing: CGFloat = 0,
        minimumLineSpacing: CGFloat = 0) {
        self.init()

        self.scrollDirection = scrollDirection
        self.itemSize = itemSize
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
    }
}
