Berlin Clock – iOS

This project is a simple iOS implementation of the Berlin Clock.

The goal of this kata was mainly to show how I approach:

problem decomposition,

testable business logic,

and clean separation between domain, time, and UI.

The project is written in Swift, using SwiftUI and Swift Concurrency.

Structure

The codebase is split into a few local Swift Package Manager modules:

ClockCore
Shared domain models used across the project.

BerlinClockDomain
Contains the Berlin Clock conversion rules.
This part is fully testable and independent from UI and time.

ClockTime
Provides the current time and exposes it as an async stream.

ClockUI
SwiftUI views and theming.
The UI only depends on semantic lamp values, not on business rules.

Bootstrap
Composition root where everything is wired together and exposed to the app.

The App target itself only depends on Bootstrap.

Tests

Tests focus on the Berlin Clock business rules.

They can be run using Swift Package Manager:

cd Packages/BerlinClockDomain
swift test


Notes

This project is intentionally kept simple:

no third-party frameworks,

no unnecessary abstractions,

focus on readability over cleverness.

The architecture reflects patterns I commonly use on real iOS projects, adapted to the scope of a kata.