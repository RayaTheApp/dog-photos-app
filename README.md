# Dog Photos App

A minimal UIKit app for a dog show interview exercise.

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

Open `DogPhotosApp.xcodeproj` in Xcode and run on a simulator or device. The app builds and shows the breed list; tap a breed to see the grid. No API keys or setup required.

### API

Documentation: https://dog.ceo/dog-api/documentation/

Dog photos can be fetched from:

| Endpoint | Description |
|----------|-------------|
| `GET https://dog.ceo/api/breeds/list/all` | All breeds + sub-breeds |
| `GET https://dog.ceo/api/breed/{breed}/images` | All images for a specific breed |
| `GET https://dog.ceo/api/breed/{breed}/{subBreed}/images` | All images for a specific sub-breed |
| `GET https://dog.ceo/api/breeds/image/random` | Random image |
