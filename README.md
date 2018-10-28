[![Releases](https://img.shields.io/github/release/gk-brown/Lima.svg)](https://github.com/gk-brown/Lima/releases)

# Introduction
Lima is an open-source framework for simplifying development of responsive iOS and tvOS applications. 

TODO Example

The project's name comes from the nautical _L_ or _Lima_ flag, representing the first letter of the word "layout":

![](README/lima.png)

This guide introduces the Lima framework and provides an overview of its key features.

# Feedback
Feedback is welcome and encouraged. Please feel free to [contact me](mailto:gk_brown@icloud.com?subject=Lima) with any questions, comments, or suggestions. Also, if you like using Lima, please consider [starring](https://github.com/gk-brown/Lima/stargazers) it!

# Contents
* [Getting Lima](#getting-lima)
* [Lima Classes](#lima-classes)
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
