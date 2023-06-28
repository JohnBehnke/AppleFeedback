#  SwiftUI Lists in macOS don't appear to be Lazy Loading like Lists in iOS (Fixed as of macOS 14)

macOS 13.4 (22F66)

If you have a list in SwiftUI and attach a `.onAppear` modifier to the items in the list, the behavior of when that `.onAppear` is called is different between macOS and iOS.

On iOS, `.onAppear` is only called when the item it’s attached to is about to actually appear on screen.
On macOS, `.onAppear` seemingly is called when the item is created. 

To reproduce this:

1) Create a state variable “showAlert” boolean and initialize it to false
2) Create a List in SwiftUI and have it read from an array of items that 200 in length.
3) Have the list render a `Text` View for each item
4) On each `Text` view, attach a `.onAppear` modifier and check if the index of the item is 100 or greater. If it is, change the “showAlert” state variable to true
5) Attach a `.alert` to the List and have it read from the state of “showAlert”
6) Observe that when you run this on iOS, the alert doesn’t appear until you’ve scrolled about halfway through the list
7) Observe that when you run this on macOS, the alert appears instantly.

I expect that SwiftUI Lists on macOS to behave similarly to those on iOS


Xcode Version: 14.3.1 (14E300c)


