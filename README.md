# Dog Photos App

A minimal UIKit app for a dog show interview exercise. Attendees can browse dog breeds, view photos, and (as you extend it) save favorites.

## What’s in the repo

- **Breed list**: Launching the app shows a **table view** with stub breed names (Breed1, Breed2, Breed3, etc.). Tapping a breed pushes the photo grid for that breed.
- **Grid**: `UICollectionView` with 2 columns, grey placeholder cells. Shown when you tap a breed.
- **Detail**: Tapping a cell in the grid pushes a detail screen (placeholder image area).
- **Long-press**: Long-press on a grid cell is recognized; preview UI is stubbed for you to implement.
- **Networking**: `DogPhotosService` is present but not implemented (stub only). No API routes are wired up; use stub data so the interviewee can complete the integration.
- **Image loading**: `ImageLoader` has a stubbed `loadImage(url:completion:)` for you to implement (with caching and cancellation).

## Getting started

### Prerequisites

- **Xcode 16+** installed from the App Store

### Running the app

Open `DogPhotosApp.xcodeproj` in Xcode and run on a simulator or device. The app builds and shows the breed list; tap a breed to see the grid. No API keys or setup required.

### API

Dog photos can be fetched from:

| Endpoint | Description |
|----------|-------------|
| `GET https://dog.ceo/api/breeds/list/all` | All breeds |
| `GET https://dog.ceo/api/breed/{breed}/images` | All images for a specific breed |
| `GET https://dog.ceo/api/breeds/image/random` | Random image |
