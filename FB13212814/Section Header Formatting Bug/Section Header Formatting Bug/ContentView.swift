//
//  ContentView.swift
//  Section Header Formatting Bug
//
//  Created by John Behnke on 9/27/23.
//

import SwiftUI

public struct ContentView: View {
    @State var test: [String] = ["1", "2", "3"]
    public var body: some View {
        
        TabView {
            CorrectView()
                .tabItem {
                    Label("Correct", systemImage: "face.smiling")
                }
            BrokenView()
                .tabItem {
                    Label("Broken", systemImage: "ant")
                }
            
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
            .navigationTitle("Logs")
    }
}

struct CorrectView: View {
    var body: some View {
        List (0..<1) { _ in
            PopoverTriggerView(text: "correctly")
        }
    }
}
struct BrokenView: View {
    var body: some View {
        
        List (0..<1) { _ in
            
            HStack {
                PopoverTriggerView(text: "incorrectly")
            }
            
        }
    }
}

struct PopoverTriggerView: View {
    @State private var showPopover: Bool = false
    let text: String
    var body: some View {
        Button {
            showPopover.toggle()
        } label: {
            Label("Press me!", systemImage: "hand.point.up.left.fill")
        }
        .popover(isPresented: $showPopover) {
            PopoverViewWithForm(text: text)
                .presentationDetents([.fraction(0.2), .fraction(0.4)])
                .presentationDragIndicator(.visible)
        }
    }
}

struct PopoverViewWithForm: View {
    let text: String
    var body: some View {
        Form {
            Section("Section Header") {
                Text("My section header is formatted \(text)")
            }
        }
    }
}
