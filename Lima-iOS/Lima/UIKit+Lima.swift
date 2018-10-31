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

public extension UILabel {
    public convenience init(text: String? = nil,
        textAlignment: NSTextAlignment = .natural, textColor: UIColor? = nil, font: UIFont? = nil,
        _ callback: ((UILabel) -> Void)? = nil) {
        self.init()

        self.text = text
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = font

        callback?(self)
    }
}

public extension UIImageView {
    public convenience init(image: UIImage? = nil,
        contentMode: UIControl.ContentMode = .scaleToFill,
        tintColor: UIColor? = nil,
        _ callback: ((UIImageView) -> Void)? = nil) {
        self.init()

        self.image = image
        self.contentMode = contentMode
        self.tintColor = tintColor

        callback?(self)
    }
}

public extension UIButton {
    public convenience init(type: UIButton.ButtonType,
        title: String? = nil, image: UIImage? = nil,
        tintColor: UIColor? = nil,
        _ callback: ((UIButton) -> Void)? = nil) {
        self.init(type: type)

        setTitle(title, for: .normal)
        setImage(image, for: .normal)

        self.tintColor = tintColor

        callback?(self)
    }
}

public extension UITextField {
    public convenience init(placeholder: String? = nil,
        textAlignment: NSTextAlignment = .natural, textColor: UIColor? = nil, font: UIFont? = nil,
        keyboardType: UIKeyboardType = .default,
        autocorrectionType: UITextAutocorrectionType = .default,
        autocapitalizationType: UITextAutocapitalizationType = .sentences,
        isSecureTextEntry: Bool = false,
        _ callback: ((UITextField) -> Void)? = nil) {
        self.init()

        self.placeholder = placeholder
        self.textAlignment = textAlignment
        self.keyboardType = keyboardType
        self.autocorrectionType = autocorrectionType
        self.autocapitalizationType = autocapitalizationType
        self.isSecureTextEntry = isSecureTextEntry

        callback?(self)
    }
}

public extension UIDatePicker {
    public convenience init(datePickerMode: UIDatePicker.Mode = .dateAndTime,
        _ callback: ((UIDatePicker) -> Void)? = nil) {
        self.init()

        self.datePickerMode = datePickerMode

        callback?(self)
    }
}

public extension UISwitch {
    public convenience init(tintColor: UIColor? = nil,
        onTintColor: UIColor? = nil,
        _ callback: ((UISwitch) -> Void)? = nil) {
        self.init()

        self.tintColor = tintColor
        self.onTintColor = onTintColor

        callback?(self)
    }
}

public extension UISegmentedControl {
    public convenience init(tintColor: UIColor? = nil,
        _ callback: ((UISegmentedControl) -> Void)? = nil) {
        self.init()

        self.tintColor = tintColor

        callback?(self)
    }
}

public extension UISlider {
    public convenience init(minimumValue: Float = 0.0, maximumValue: Float = 1.0,
        _ callback: ((UISlider) -> Void)? = nil) {
        self.init()

        self.minimumValue = minimumValue
        self.maximumValue = maximumValue

        callback?(self)
    }
}

public extension UIStepper {
    public convenience init(minimumValue: Double = 0.0, maximumValue: Double = 100.0,
        stepValue: Double = 1.0,
        _ callback: ((UIStepper) -> Void)? = nil) {
        self.init()

        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.stepValue = stepValue

        callback?(self)
    }
}

public extension UIPageControl {
    public convenience init(pageIndicatorTintColor: UIColor? = nil,
        currentPageIndicatorTintColor: UIColor? = nil,
        _ callback: ((UIPageControl) -> Void)? = nil) {
        self.init()

        self.pageIndicatorTintColor = pageIndicatorTintColor
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor

        callback?(self)
    }
}

public extension UIActivityIndicatorView {
    public convenience init(style: UIActivityIndicatorView.Style,
        color: UIColor? = nil,
        _ callback: ((UIActivityIndicatorView) -> Void)? = nil) {
        self.init(style: style)

        self.color = color

        callback?(self)
    }
}

public extension UIProgressView {
    public convenience init(progressTintColor: UIColor? = nil,
        trackTintColor: UIColor? = nil,
        _ callback: ((UIProgressView) -> Void)? = nil) {
        self.init()

        self.progressTintColor = progressTintColor
        self.trackTintColor = trackTintColor

        callback?(self)
    }
}

public extension UITextView {
    public convenience init(text: String? = nil,
        isEditable: Bool = true, isSelectable: Bool = true,
        textAlignment: NSTextAlignment = .natural, textColor: UIColor? = nil, font: UIFont? = nil,
        _ callback: ((UITextView) -> Void)? = nil) {
        self.init()

        self.text = text
        self.isEditable = isEditable
        self.isSelectable = isSelectable
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.font = font

        callback?(self)
    }
}
