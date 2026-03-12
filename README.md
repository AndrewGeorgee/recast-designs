# AlterNow

A Flutter mobile app showcasing loyalty points, venue selection, and user profile with a dark theme and gold accents.

## Features

- **Home Screen** – Welcome header, loyalty points card with progress bar, total orders, and venue selection grid
- **Profile Screen** – User identity, loyalty history with transaction cards
- **Venue Selection** – Masonry-style 2-column grid of venue cards with depth-of-field blur
- **Responsive Layout** – Scaled for 390×844 design resolution
- **Dark Theme** – Custom typography (Satoshi font) and gold gradient accents

## Requirements

- Flutter SDK ^3.10.4
- Dart ^3.10.4

## Getting Started

1. Clone the repository
2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:

   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── app.dart                 # App shell, routing, responsive init
├── main.dart
├── app_assets.dart          # Asset path constants
├── app_strings.dart        # Centralized strings
├── data/
│   └── mock_data.dart      # Mock user, venues, loyalty history
├── models/
│   ├── user.dart
│   ├── venue.dart
│   └── loyalty_entry.dart
├── screens/
│   ├── home/
│   │   ├── home_screen.dart
│   │   └── widgets/
│   ├── profile/
│   │   ├── profile_screen.dart
│   │   └── widgets/
│   └── venue_selection/
│       ├── venue_selection_screen.dart
│       └── widgets/
├── shared/widgets/         # Reusable UI components
├── theme/                  # Colors, typography, responsive scaling
└── widgets/                # App-wide widgets
```

## Design

- **Design Resolution**: 390×844 px
- **Font**: Satoshi Variable
- **Theme**: Dark background (#000000), gold gradient accents (#E4B679 → #FEE5C4)

## License

Private project.
