# Dog Photos App

A minimal UIKit app for a dog show interview exercise.

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
