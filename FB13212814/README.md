#  SwiftUI Lists in macOS don't appear to be Lazy Loading like Lists in iOS (Fixed as of macOS 14)

iOS 17

If you have a SwiftUI Form with a Section that has a header, and the form is presented as a popover, and the view that the popover is attached to is embedded in multiple H/V/Z Stacks which are embedded in a List, the Section Header will lose its formatting and display in a black font with no font style.

To recreate, please see the attached Xcode project. It’s too complicated to explain here. 

I expect the section header to be formatted correctly as presented in the “Correct Formatting.png” image, but instead its displaying as shown in the “Incorrect Formatting.png” image.

