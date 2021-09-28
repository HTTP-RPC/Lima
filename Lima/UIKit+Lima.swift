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
        with: ((UILabel) -> Void) = { _ in }) {
        self.init()

        self.text = text
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = font
        self.numberOfLines = numberOfLines
        self.lineBreakMode = lineBreakMode

        self.width = width
        self.weight = weight
        self.anchor = anchor

        with(self)
    }
}

public extension UIImageView {
    convenience init(image: UIImage? = nil,
        contentMode: UIControl.ContentMode = .scaleToFill,
        tintColor: UIColor? = nil,
        width: CGFloat = .nan, height: CGFloat = .nan,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UIImageView) -> Void) = { _ in }) {
        self.init()

        self.image = image
        self.contentMode = contentMode
        self.tintColor = tintColor

        self.width = width
        self.height = height
        self.weight = weight
        self.anchor = anchor

        with(self)
    }
}

public extension UIButton {
    convenience init(type: UIButton.ButtonType, primaryAction: UIAction? = nil,
        tintColor: UIColor? = nil,
        anchor: LMAnchor = [],
        with: ((UIButton) -> Void) = { _ in }) {
        self.init(type: type, primaryAction: primaryAction)

        self.tintColor = tintColor

        self.anchor = anchor

        with(self)
    }

    convenience init(configuration: UIButton.Configuration, primaryAction: UIAction? = nil,
        menu: UIMenu? = nil,
        showsMenuAsPrimaryAction: Bool = false,
        changesSelectionAsPrimaryAction: Bool = false,
        preferredBehavioralStyle: UIBehavioralStyle = .automatic,
        width: CGFloat = .nan,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UIButton) -> Void) = { _ in }) {
        self.init(configuration: configuration, primaryAction: primaryAction)
        
        self.menu = menu
        self.showsMenuAsPrimaryAction = showsMenuAsPrimaryAction
        self.changesSelectionAsPrimaryAction = changesSelectionAsPrimaryAction
        self.preferredBehavioralStyle = preferredBehavioralStyle

        self.width = width
        self.weight = weight
        self.anchor = anchor

        with(self)
    }
}

public extension UITextField {
    convenience init(primaryAction: UIAction? = nil,
        placeholder: String? = nil,
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
        with: ((UITextField) -> Void) = { _ in }) {
        if (primaryAction == nil) {
            self.init()
        } else {
            self.init(frame: CGRect(), primaryAction: primaryAction)
        }

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

        with(self)
    }
}

public extension UIDatePicker {
    convenience init(primaryAction: UIAction? = nil,
        datePickerMode: UIDatePicker.Mode = .dateAndTime,
        preferredDatePickerStyle: UIDatePickerStyle = .automatic,
        width: CGFloat = .nan,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UIDatePicker) -> Void) = { _ in }) {
        if (primaryAction == nil) {
            self.init()
        } else {
            self.init(frame: CGRect(), primaryAction: primaryAction)
        }

        self.datePickerMode = datePickerMode

        self.width = width
        self.weight = weight
        self.anchor = anchor

        with(self)
    }
}

public extension UISwitch {
    convenience init(primaryAction: UIAction? = nil,
        tintColor: UIColor? = nil,
        onTintColor: UIColor? = nil,
        anchor: LMAnchor = [],
        with: ((UISwitch) -> Void) = { _ in }) {
        if (primaryAction == nil) {
            self.init()
        } else {
            self.init(frame: CGRect(), primaryAction: primaryAction)
        }
        
        self.tintColor = tintColor
        self.onTintColor = onTintColor
        
        self.anchor = anchor

        with(self)
    }
}

public extension UISegmentedControl {
    convenience init(primaryAction: UIAction? = nil,
        tintColor: UIColor? = nil,
        width: CGFloat = .nan,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UISegmentedControl) -> Void) = { _ in }) {
        if (primaryAction == nil) {
            self.init()
        } else {
            self.init(frame: CGRect(), primaryAction: primaryAction)
        }

        self.tintColor = tintColor

        self.width = width
        self.weight = weight
        self.anchor = anchor

        with(self)
    }
}

public extension UISlider {
    convenience init(primaryAction: UIAction? = nil,
        minimumValue: Float = 0.0, maximumValue: Float = 1.0, isContinuous: Bool = true,
        preferredBehavioralStyle: UIBehavioralStyle = .automatic,
        width: CGFloat = .nan,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UISlider) -> Void) = { _ in }) {
        if (primaryAction == nil) {
            self.init()
        } else {
            self.init(frame: CGRect(), primaryAction: primaryAction)
        }

        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.isContinuous = isContinuous
        self.preferredBehavioralStyle = preferredBehavioralStyle

        self.width = width
        self.weight = weight
        self.anchor = anchor

        with(self)
    }
}

public extension UIStepper {
    convenience init(primaryAction: UIAction? = nil,
        minimumValue: Double = 0.0, maximumValue: Double = 100.0, stepValue: Double = 1.0,
        anchor: LMAnchor = [],
        with: ((UIStepper) -> Void) = { _ in }) {
        if (primaryAction == nil) {
            self.init()
        } else {
            self.init(frame: CGRect(), primaryAction: primaryAction)
        }

        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.stepValue = stepValue

        self.anchor = anchor

        with(self)
    }
}

public extension UIPageControl {
    convenience init(primaryAction: UIAction? = nil,
        hidesForSinglePage: Bool = false,
        pageIndicatorTintColor: UIColor? = nil,
        currentPageIndicatorTintColor: UIColor? = nil,
        backgroundStyle: UIPageControl.BackgroundStyle = .automatic,
        allowsContinuousInteraction: Bool = true,
        preferredIndicatorImage: UIImage? = nil,
        anchor: LMAnchor = [],
        with: ((UIPageControl) -> Void) = { _ in }) {
        if (primaryAction == nil) {
            self.init()
        } else {
            self.init(frame: CGRect(), primaryAction: primaryAction)
        }

        self.hidesForSinglePage = hidesForSinglePage
        self.pageIndicatorTintColor = pageIndicatorTintColor
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        self.backgroundStyle = backgroundStyle
        self.allowsContinuousInteraction = allowsContinuousInteraction
        self.preferredIndicatorImage = preferredIndicatorImage

        self.anchor = anchor

        with(self)
    }
}

public extension UIActivityIndicatorView {
    convenience init(style: UIActivityIndicatorView.Style = .medium,
        color: UIColor? = nil,
        anchor: LMAnchor = [],
        with: ((UIActivityIndicatorView) -> Void) = { _ in }) {
        self.init(style: style)

        self.color = color

        self.anchor = anchor

        with(self)
    }
}

public extension UIProgressView {
    convenience init(progressTintColor: UIColor? = nil,
        trackTintColor: UIColor? = nil,
        width: CGFloat = .nan,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UIProgressView) -> Void) = { _ in }) {
        self.init()

        self.progressTintColor = progressTintColor
        self.trackTintColor = trackTintColor

        self.width = width
        self.weight = weight
        self.anchor = anchor

        with(self)
    }
}

public extension UITextView {
    convenience init(textContainer: NSTextContainer? = nil,
        isEditable: Bool = true, isSelectable: Bool = true,
        textAlignment: NSTextAlignment = .natural, textColor: UIColor? = nil, font: UIFont? = nil,
        width: CGFloat = .nan, height: CGFloat = .nan,
        weight: CGFloat = .nan,
        anchor: LMAnchor = [],
        with: ((UITextView) -> Void) = { _ in }) {
        self.init(frame: CGRect(), textContainer: textContainer)

        self.isEditable = isEditable        
        self.isSelectable = isSelectable
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = font

        self.width = width
        self.height = height
        self.weight = weight
        self.anchor = anchor

        with(self)
    }
}

public extension UITableViewCell {
    convenience init(style: UITableViewCell.CellStyle,
        text: String? = nil, secondaryText: String? = nil, image: UIImage? = nil,
        accessoryType: UITableViewCell.AccessoryType = .none,
        selectionStyle: UITableViewCell.SelectionStyle = .blue,
        with: ((UITableViewCell) -> Void) = { _ in }) {
        self.init(style: style, reuseIdentifier: nil)

        var contentConfiguration = defaultContentConfiguration()
        
        contentConfiguration.text = text
        contentConfiguration.secondaryText = secondaryText
        contentConfiguration.image = image

        self.contentConfiguration = contentConfiguration
        
        self.accessoryType = accessoryType
        self.selectionStyle = selectionStyle

        with(self)
    }
}

public extension UITableViewHeaderFooterView {
    convenience init(text: String? = nil, secondaryText: String? = nil,
        with: ((UITableViewHeaderFooterView) -> Void) = { _ in }) {
        self.init()

        var contentConfiguration = defaultContentConfiguration()
        
        contentConfiguration.text = text
        contentConfiguration.secondaryText = secondaryText

        self.contentConfiguration = contentConfiguration

        with(self)
    }
}
