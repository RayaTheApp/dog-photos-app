# Dog Photos App – Interview Instructions

We’d like you to add functionality to a simple dog-photo app, and fix any bugs that you may discover. The repo already builds and shows a simple collection view grid, detail view, and a stubbed long-press preview. The goal of this exercise is to work together, and treat this like a real team task.

**Please implement using UIKit and RxSwift or Combine.**

Here are the list of features we want added to the application. Please prioritize and pick the order of which to implement first based on what you think would be most important.

- **Load images from API**  
  Use the dog.ceo API to fetch photo URLs and display the images in the grid and detail view.

- **Pagination**  
  Either add a Load More button, or do continuous scroll with an activity indicator as a loading state.

- **Pull to Refresh**  
  Pull to refresh should fetch a new batch of dog photos.

- **ImageLoader + Caching**  
  Create an ImageLoader that supports caching and cancellations.

- **State Machine & Clean ViewModel**  
  Clean up the view model to provide clear outputs: items, isLoading, isRefreshing, isLoadingMore, error.

- **Long-Press Preview**  
  Complete the long-press gesture preview.
