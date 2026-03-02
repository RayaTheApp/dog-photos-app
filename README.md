# Dog Photos App

A minimal UIKit app that shows a grid of placeholder cells (grey boxes), a detail view, and a stubbed long-press preview. Use this repo as the starting point for the interview exercise below.

## What’s in the repo

- **Grid**: `UICollectionView` with 2 columns, grey placeholder cells.
- **Detail**: Tapping a cell pushes a detail screen (placeholder image area).
- **Long-press**: Long-press on a cell is recognized; preview UI is stubbed for you to implement.
- **Networking**: `DogPhotosService` is present but not implemented (stub only).
- **Image loading**: `ImageLoader` has a stubbed `loadImage(url:completion:)` for you to implement (with caching and cancellation).

## Getting started

### Prerequisites

- **Xcode 16+** installed from the App Store
- An **Anthropic API key** (provided by your interviewer)

### Option A: Automated setup (recommended)

Run the setup script — it will install Claude Code CLI (if needed) and configure your API key:

```bash
./setup.sh <your-api-key>
```

Or run it without arguments and paste the key when prompted:

```bash
./setup.sh
```

Then start Claude Code:

```bash
source .env && claude
```

### Option B: Manual setup

1. Install Claude Code CLI:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

2. Export your API key and launch:

```bash
export ANTHROPIC_API_KEY=<your-api-key>
claude
```

### Running the app

Open `DogPhotosApp.xcodeproj` in Xcode and run on a simulator or device. The app builds and shows the grid and navigation; no additional API keys or setup required.

## Interview exercise

We’d like you to add functionality to this app and fix any bugs you find. The repo already builds and shows a simple collection view grid, detail view, and a stubbed long-press preview. Treat this like a real team task and use AI as you would on the job.

**Please implement using UIKit and RxSwift or Combine.**

Implement the following, in whatever order you think is most important:

1. **Load images from API**  

2. **Breed Parsing + Search**  

3. **Pagination**  

4. **ImageLoader + caching**  

5. **ViewModel State Cleanup**  

6. **Error Handling**  

7. **Pull to refresh**  

8. **Empty States**  

9. **Tests**  

10. **Long-press preview**  

11. **Logging**  

---

**API:** Dog photos can be fetched from:

- `https://dog.ceo/api/breeds/image/random/50`  
  (Returns 50 random image URLs; each request is random, so it can be used for both refresh and “load more”.)
