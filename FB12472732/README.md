# Toolbars in macOS don't behave correctly in 3-Column NavigationSplitView

On macOS (13.4.1 & 14.0 Beta 2), if you are using a NavigationSplitView in a 3 Column layout, the content view Toolbar behaves inconstantly in regards to the placement of ToolBarItems with the `.navigation` placement option depending on if the detail view also has a toolbar.

If the detail view does not have a toolbar, the content view toolbar item set to “.navigation” will appear to the right of the sidebar toggle button. 

If the detail view does have a toolbar, the content view toolbar item set to “.navigation” will appear to the left of the sidebar toggle button. 

I would expect the toolbar item set to .navigation in the content view to always be to the right of the sidebar toggle button

Xcode Version 14.3.1 (14E300c)