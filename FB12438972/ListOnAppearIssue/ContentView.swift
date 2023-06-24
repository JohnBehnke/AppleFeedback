//
//  ContentView.swift
//  ListOnAppearIssue
//
//  Created by John Behnke on 6/24/23.
//

import SwiftUI
import os

struct ContentView: View {
  
  private let logger = Logger(
    subsystem: Bundle.main.bundleIdentifier!,
    category: String(describing: ContentView.self)
  )
  
  @State var items: [Int] = Array(0..<200)
  @State private var shouldBeTrueAfterHalfOfItemsHaveAppeared = false
  var threshold: Int = 100
  var body: some View {
    List(items, id: \.self) { item in
      Text("\(item)")
        .onAppear {
          if item <= items.count / 2 {
            logger.info("Item #\(item) is appearing or is about to appear")
          } else {
            shouldBeTrueAfterHalfOfItemsHaveAppeared = true
            logger.info("Item #\(item) is appearing or is about to appear, load more data")
          }
        }
    }
    //This alert should only appear after half of the items have appeared
    .alert("More than the threshold (\(threshold)) of items have appeared", isPresented: $shouldBeTrueAfterHalfOfItemsHaveAppeared, actions: {})
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
