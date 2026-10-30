# Astro Torch

A small SwiftUI learning project that changes the screen's background color with the tap of a button. It demonstrates state, view composition, button actions, and animation without external dependencies.

Astro Torch changes the screen color only. It does not control the camera flashlight or adjust screen brightness.

## Features

- Cycle through red, blue, green, purple, and orange in a fixed order.
- Transition between colors with a 0.3-second animation.
- Display an edge-to-edge background with a centered title and button.
- Use built-in SF Symbols for the app's visual elements.

## Screenshots

Captured in the iPhone 16 Pro simulator. These show four of the five available colors.

<table>
	<tr>
		<th>Green</th>
		<th>Orange</th>
	</tr>
	<tr>
		<td><img src="Resources/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-10-30%20at%2017.35.54.png" alt="Astro Torch with a green background and Change Color button" width="240" /></td>
		<td><img src="Resources/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-10-30%20at%2017.36.18.png" alt="Astro Torch with an orange background and Change Color button" width="240" /></td>
	</tr>
	<tr>
		<th>Red</th>
		<th>Blue</th>
	</tr>
	<tr>
		<td><img src="Resources/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-10-30%20at%2017.36.30.png" alt="Astro Torch with a red background and Change Color button" width="240" /></td>
		<td><img src="Resources/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-10-30%20at%2017.36.37.png" alt="Astro Torch with a blue background and Change Color button" width="240" /></td>
	</tr>
</table>

## Requirements

- A Mac with Xcode 16.4 or later and the iOS SDK installed.
- An iOS simulator or a compatible iPhone running iOS 18.5 or later, matching the project's current deployment target.

## Run Locally

1. Open [Astro Torch.xcodeproj](Astro%20Torch.xcodeproj) in Xcode.
2. Select the **Astro Torch** scheme and an iPhone simulator in the toolbar.
3. Press **Command + R** to build and run.
4. Tap **Change Color** to advance to the next background color.

To run on a physical iPhone, select your device and choose your own development team under **Signing & Capabilities**. Xcode may also ask you to use a unique bundle identifier.

## Project Structure

| Location | Purpose |
| --- | --- |
| [Astro_TorchApp.swift](Astro%20Torch/Astro_TorchApp.swift) | App entry point. Opens `ContentView` inside a `WindowGroup`. |
| [ContentView.swift](Astro%20Torch/ContentView.swift) | Screen layout, color collection, state, and button action. |
| [Assets.xcassets](Astro%20Torch/Assets.xcassets) | Asset catalog containing the accent color and app icon configuration. |
| [Resources](Resources) | Simulator screenshots used in this README. |

## How It Works

The app has a single screen and keeps its behavior local to `ContentView`:

1. `Astro_TorchApp` creates the main window and displays `ContentView`.
2. A `[Color]` array defines the available backgrounds.
3. `@State` stores `colorIndex`, initially `0`, so the screen starts red.
4. A `ZStack` places the selected background behind a `VStack` containing the icon, title, and button.
5. Tapping the button changes `colorIndex`. SwiftUI updates the background and animates the change.

The button advances the selection with:

```swift
colorIndex = (colorIndex + 1) % colors.count
```

Array positions start at zero. Adding one moves to the next position; the remainder operator (`%`) wraps the selection back to zero after the final color. Using `colors.count` means the same logic works when more colors are added, as long as the array is not empty.

### Frameworks and Design Choices

- **Swift:** Defines the view, color array, and selection logic.
- **SwiftUI:** Builds the interface, tracks local state with `@State`, and animates updates with `withAnimation`.
- **SF Symbols:** Supplies the `sparkles` and `paintpalette.fill` icons through `Image` and `Label`.
- **Local state:** The selected color is not saved between launches. No database, network service, or third-party package is needed.
- **Full-screen background:** `ignoresSafeArea()` extends the color to the screen edges while the controls remain within the normal safe area.

## Manual Check

1. Launch the app and confirm that the initial background is red.
2. Tap the button five times. The sequence should be blue, green, purple, orange, then red again.
3. Confirm that the icon, title, and button stay in place while the background transitions smoothly.

## Learning Exercise

Add `.pink` to the `colors` array in [ContentView.swift](Astro%20Torch/ContentView.swift), then run the app again. The button will include the new color automatically because the wraparound calculation uses the array's current count.
