//
//  ContentView.swift
//  Astro Torch
//
//  Created by bansikah on 30/10/2026.
//

// Imports Apple's framework for building user interfaces.
import SwiftUI

// Defines the main view displayed by the app.
struct ContentView: View {
    // An array stores our colors in order.
    // "let" means this collection cannot be reassigned.
    private let colors: [Color] = [
        .red, .blue, .green, .purple, .orange
    ]

    // Stores the selected color's position, starting at zero.
    // @State tells SwiftUI to refresh the view when this changes.
    @State private var colorIndex = 0

    // Describes the view's layout and appearance.
    var body: some View {
        // Layers views: the first is behind the others.
        ZStack {
            // Gets the color at the current position in the array.
            colors[colorIndex]
                // Extends the background to the screen's edges.
                .ignoresSafeArea()

            // Arranges the icon, title, and button vertically.
            VStack(spacing: 24) {
                // Displays a built-in Apple SF Symbol.
                Image(systemName: "sparkles")
                    .font(.system(size: 60))

                Text("Astro Torch")
                    .font(.largeTitle)
                    .bold()

                Button {
                    // Animates the color change over 0.3 seconds.
                    withAnimation(.easeInOut(duration: 0.3)) {
                        // Advances to the next color.
                        // % wraps the index back to zero at the end.
                        colorIndex = (colorIndex + 1) % colors.count
                    }
                } label: {
                    // Defines the button's text and icon.
                    Label("Change Color", systemImage: "paintpalette.fill")
                        .font(.headline)
                        .padding()
                        .foregroundStyle(.black)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            // Sets the default foreground color for this stack.
            // The button's explicit black color takes precedence.
            .foregroundStyle(.white)
            .padding()
        }
    }
}

// Displays this view in Xcode's preview canvas.
#Preview {
    ContentView()
}