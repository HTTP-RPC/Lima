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

Finally, Lima adds initializers to common UIKit views and controls to simplify their declaration in a view hieararchy. 

All of these classes and extensions are discussed in more detail below.

## LMRowView and LMColumnView
TODO

## LMSpacer
TODO

## LMAnchorView
TODO

## LMRootView
TODO

## LMScrollView
TODO

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
