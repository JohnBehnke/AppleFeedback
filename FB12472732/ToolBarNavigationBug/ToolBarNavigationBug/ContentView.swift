//
//  ContentView.swift
//  ToolBarNavigationBug
//
//  Created by John Behnke on 6/28/23.
//

import SwiftUI

struct ContentView: View {
  @State var showDetailToolbar: Bool = false
  var body: some View {
    NavigationSplitView(sidebar: {
      List {
        Section("Section") {
          Text("Foo")
          Text("Bar")
          Text("Baz")
        }
      }
    }, content: {
      List(0..<20) { i in
        Text("List item \(i)")
      }
      .navigationTitle("")
      .toolbar {
        //This ToolBarItem changes position relative to the "toggle sidebar button" depending if
        //there is a toolbar in the detail view. If there is, it is to the left of the sidebar button,
        //if there is not a toolbar in the detail view, it is to the right of the sidebar button
        ToolbarItem(placement: .navigation) {
          VStack(alignment: .leading) {
            Text("Navigation Title").bold()
            Text("Navigation Subtitle").font(.subheadline)
          }
        }
      }
    }, detail: {
      VStack {
        Text("The ToolBarItem set to navigation placement in the content view is to the \(showDetailToolbar ?  "left" : "right")")
        Button {
          self.showDetailToolbar.toggle()
        } label: {
          Text("Toggle Sidebar to show the issue")
          
        }
      }
      .toolbar {
        if showDetailToolbar {
          ToolbarItem {
            Image(systemName: "ant.fill")
          }
        }
      }
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
