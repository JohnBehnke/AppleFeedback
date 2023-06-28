# NavigationSplitView 3-Column Layout should be able to hide the SideBar toggle button

When utilizing the SwiftUI NavigationSplitView in a 3-Column capability, I believe you should be able to hide the button in the toolbar that collapses the sidebar. It can interfere with creating a dense and useful toolbar. For example, this button is not present in many stock Apple apps (Mail.app, FeedbackAssistant.app, etc). 

Possible example code to disable it:

```swift
.toolbar {
 …
}
.showsSideBarToggleButton(false)
```