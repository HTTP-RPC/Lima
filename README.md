[![Releases](https://img.shields.io/github/release/gk-brown/Lima.svg)](https://github.com/gk-brown/Lima/releases)

# Introduction
Lima is an open-source framework for simplifying development of responsive iOS and tvOS applications. The project's name comes from the nautical _L_ or _Lima_ flag, representing the first letter of the word "layout":

![](README/lima.png)

This guide introduces the Lima framework and provides an overview of its key features.

# Feedback
Feedback is welcome and encouraged. Please feel free to [contact me](mailto:gk_brown@icloud.com?subject=Lima) with any questions, comments, or suggestions. Also, if you like using Lima, please consider [starring](https://github.com/gk-brown/Lima/stargazers) it!

# Contents
* [Getting Lima](#getting-lima)
* [Lima Classes](#lima-classes)
    * [LMRowView and LMColumnView](#lmrowview-and-lmcolumnview)
    * [LMSpacer](#lmspacer)
    * [LMAnchorView](#lmanchorview)
    * [LMRootView](#lmrootview)
    * [LMScrollView](#lmscrollview)
    * [LMTableViewCell and LMTableViewHeaderFooterView](#lmtableviewcell-and-lmtableviewheaderfooterview)
    * [LMCollectionViewCell](#lmcollectionviewcell)
    * [UIKit Extensions](#uikit-extensions)
* [Deployment](#deployment)
* [Additional Information](#additional-information)

# Getting Lima
Lima is distributed as a universal binary that will run in the iOS simulator as well as on an actual device. Either iOS 10 or tvOS 10 or later is required. 

To install:

* Download the [latest release](https://github.com/gk-brown/Lima/releases) archive and expand
* In Xcode, select the project root node in the Project Navigator view
* Select the application target
* Select the "General" tab
* Drag _Lima.framework_ to the "Embedded Binaries" section
* In the dialog that appears, ensure that "Copy items if needed" is checked and click "Finish"

Note that the framework binary must be "trimmed" prior to App Store submission. See the [Deployment](#deployment) section for more information.

# Lima Classes
Auto layout is an iOS feature that allows developers to create applications that automatically adapt to device size, orientation, or content changes. An application built using auto layout generally has little or no hard-coded view positioning logic, but instead dynamically arranges user interface elements based on their preferred or "intrinsic" content sizes.

Auto layout in iOS is implemented primarily via layout constraints, which, while powerful, are not particularly convenient to work with. To simplify the process, Lima provides the following view classes, whose sole responsibility is managing the size and position of their respective subviews:

* `LMRowView` - arranges subviews in a horizontal line
* `LMColumnView` - arranges subviews in a vertical line
* `LMAnchorView` - anchors subviews to one or more edges
* `LMRootView` - provides a margin-independent root for a view hierarchy

These classes use layout constraints internally, allowing developers to easily take advantage of auto layout while eliminating the need to manage constraints directly. They can be nested to create complex layouts that automatically adjust to orientation or screen size changes. 

Lima also provides the following view classes to simplify the use of some common UIKit types:
 
* `LMScrollView` - extends `UIScrollView` to automatically adapt to content size
* `LMTableViewCell` - extends `UITableViewCell` to automatically pin content to edges
* `LMTableViewHeaderFooterView` - extends `UITableViewHeaderFooterView` to automatically pin content to edges
* `LMCollectionViewCell` - extends `UICollectionViewCell` to automatically pin content to edges

Lima adds the following properties to `UIView` to customize how subviews are sized and positioned within a parent view:

- `width` - assigns a fixed width to a view
- `height` - assigns a fixed height to a view
- `weight` - when used with row and column views, determines how excess space is allocated within the parent
- `anchor` - when used with anchor views, determines the edges to which the view will be anchored within the parent
- `displayable` - determines whether the view will participate in auto layout (`true` by default)

Additionally, the `LMSpacer` class can be used to create fixed or flexible space between other views.

Finally, Lima adds initializers to common UIKit views and controls to simplify their declaration in a view hieararchy. For example ...

TODO

Each of these classes and extensions is discussed in more detail below.

## LMRowView and LMColumnView
TODO

## LMSpacer
A common use for weights is to add flexible space around a view. For example, the following code could be used to center a label horizontally within a row view:

```swift
LMRowView(
    UIView() { $0.weight = 1 },
    UILabel(text: "Hello, World!"),
    UIView() { $0.weight = 1 }
)
```

Because spacer views are so common, Lima provides a dedicated `UIView` subclass called `LMSpacer` for conveniently creating flexible space between other views. `LMSpacer` has a default weight of 1, so the previous example could be rewritten as follows, eliminating the closures and improving readability:

```swift
LMRowView(
    LMSpacer(),
    UILabel(text: "Hello, World!"),
    LMSpacer()
)
```

Like layout views, spacer views do not consume touch events by default, so they will not interfere with any user interface elements that appear underneath them. Assigning a non-`nil` background color to a spacer view causes the view to begin consuming events.
 
See [LMSpacer.h](https://github.com/gk-brown/Lima/blob/master/Lima-iOS/Lima/LMSpacer.h) for more information.

## LMAnchorView
The `LMAnchorView` class optionally anchors subviews to one or more of its own edges. Although it is possible to achieve similar layouts using a combination of row, column, and spacer views, anchor views may offer a simpler alternative in some cases. 

Anchors are specified as an option set that defines the edges to which the view will be anchored within its parent. For example, the following code creates an anchor view containing four labels anchored to its top, left, right, and bottom edges. The labels will all be inset by 16 pixels:

```swift
LMAnchorView(margin: 16,
    UILabel(text: "Top", anchor: [.top]),
    UILabel(text: "Left", anchor: [.left]),
    UILabel(text: "Right", anchor; [.right]),
    UILabel(text: "Bottom", anchor: [.bottom])
)
```

Subviews may also be anchored to the leading and trailing edges of the parent view to support right-to-left locales; for example:

```swift
LMAnchorView(margin: 16,
    UILabel(text: "Leading", anchor: [.leading]),
    UILabel(text: "Trailing", anchor: [.trailing])
)
```

Additionally, subviews may be anchored to multiple edges for a given dimension. For example, the following code creates an anchor view containing two labels, each of which will span the entire width of the anchor view:

```swift
LMAnchorView(margin: 16,
    UILabel(text: "Top", anchor: [.top, .left, .right]),
    UILabel(text: "Bottom", anchor: [.bottom, .left, .right])
)
```

If no anchor is specified for a given dimension, the subview will be centered within the anchor view for that dimension.

See [LMAnchorView.h](https://github.com/gk-brown/Lima/blob/master/Lima-iOS/Lima/LMAnchorView.h) for more information.

## LMRootView
In iOS 10, `UIKit` may in some cases assign system-defined, non-overridable values for a view's margins. In such cases, the `LMRootView` class can be used. This class always pins subviews to its edges instead of its margins, and provides the following properties that can be used to reserve additional space at the top and bottom of the view, respectively:

```swift
var topPadding: CGFloat
var bottomPadding: CGFloat
```

For example, a view controller might override `viewWillLayoutSubviews` to set the root view's top and bottom spacing to the length of its top and bottom layout guides, respectively, ensuring that any subviews are positioned between the guides:

```swift
override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()

    rootView.topPadding = topLayoutGuide.length
    rootView.bottomPadding = bottomLayoutGuide.length
}
```

Top and bottom layout guides are deprecated in iOS 11. Applications targeting iOS 11 and later can use the `viewRespectsSystemMinimumLayoutMargins` property of `UIViewController` instead of `LMRootView` to disable system-defined margins.

See [LMRootView.h](https://github.com/gk-brown/Lima/blob/master/Lima-iOS/Lima/LMRootView.h) for more information.

## LMScrollView
The `LMScrollView` class extends the standard `UIScrollView` class to simplify the declaration of scrollable content. It presents a single content view, optionally allowing the user to scroll in one or both directions.

The scroll view's content is specified via the `contentView` property. The following `LMScrollView` properties determine how the content is presented:

```swift
var isFitToWidth: Bool
var isFitToHeight: Bool
```

When both values are set to `false` (the default), the scroll view will automatically display scroll bars when needed, allowing the user to pan in both directions to see the content in its entirety. For example:

```swift
LMScrollView(
    UIImageView(image: UIImage(named: "large_image.png"))
)
```

When `fitToWidth` is set to `true`, the scroll view will ensure that the width of its content matches its own width, causing the content to wrap and scroll in the vertical direction. The vertical scroll bar will be displayed when necessary, but the horizontal scroll bar will never be shown, since the width of the content will never exceed the width of the scroll view:

```swift
LMScrollView(fitToWidth: true,
    UILabel(text: "Lorem ipsum dolor sit amet...", 
        numberOfLines: 0)
)
```

Similarly, when `fitToHeight` is `true`, the scroll view will ensure that the height of its content matches its own height, causing the content to wrap and scroll in the horizontal direction. The vertical scroll bar will never be shown, and the horizontal scroll bar will appear when necessary.

See [LMScrollView.h](https://github.com/gk-brown/Lima/blob/master/Lima-iOS/Lima/LMScrollView.h) for more information.

## LMTableViewCell and LMTableViewHeaderFooterView
TODO

## LMCollectionViewCell
TODO

## UIKit Extensions
TODO

# Deployment
The Lima framework is a universal binary that must be "trimmed" prior to submission to the App Store:

* Place the _[trim.sh](Xcode/trim.sh)_ script in your project root directory
* Ensure that the script has execute permission (e.g. 744)
* Create a new "Run Script" build phase after the "Embed Frameworks" phase
* Rename the new build phase to "Trim Framework Executables" or similar (optional)
* Invoke the script (e.g. `"${SRCROOT}/trim.sh" Lima`)

# Additional Information
This guide introduced the Lima framework and provided an overview of its key features. For additional information, see the the [examples](https://github.com/gk-brown/Lima/tree/development/Lima-iOS/LimaTest).
