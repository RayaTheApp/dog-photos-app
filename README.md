# Dog Photos App

A minimal UIKit app that shows a grid of placeholder cells (grey boxes), a detail view, and a stubbed long-press preview. Use this repo as the starting point for the interview exercise below.

## What’s in the repo

- **Grid**: `UICollectionView` with 2 columns, grey placeholder cells.
- **Detail**: Tapping a cell pushes a detail screen (placeholder image area).
- **Long-press**: Long-press on a cell is recognized; preview UI is stubbed for you to implement.
- **Networking**: `DogPhotosService` is present but not implemented (stub only).
- **Image loading**: `ImageLoader` has a stubbed `loadImage(url:completion:)` for you to implement (with caching and cancellation).

## How to run

Open `DogPhotosApp.xcodeproj` in Xcode and run on a simulator or device. The app builds and shows the grid and navigation; no API keys or setup required.

## Interview exercise

We’d like you to add functionality to this app and fix any bugs you find. The repo already builds and shows a simple collection view grid, detail view, and a stubbed long-press preview. Treat this like a real team task and use AI as you would on the job.

**Please implement using UIKit and RxSwift or Combine.**

Implement the following, in whatever order you think is most important:

1. **Load images from API**  
   Use the dog.ceo API to fetch photo URLs and display the images in the grid and detail view.

2. **Pagination**  
   Either a “Load more” button or infinite scroll, with an activity indicator as the loading state.

3. **Pull to refresh**  
   Pull-to-refresh should fetch a new batch of dog photos.

4. **ImageLoader + caching**  
   Implement `ImageLoader` with caching and request cancellation.

5. **State machine & clean ViewModel**  
   Refine the view model so it exposes clear outputs: `items`, `isLoading`, `isRefreshing`, `isLoadingMore`, `error`.

6. **Long-press preview**  
   Complete the long-press gesture so it shows a fullscreen preview of the photo while pressed and dismisses when the user releases.

---

**API:** Dog photos can be fetched from:

- `https://dog.ceo/api/breeds/image/random/50`  
  (Returns 50 random image URLs; each request is random, so it can be used for both refresh and “load more”.)
