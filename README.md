# FlickFrenzy
This is an iOS app for keeping a watchlist and exploring more about movies.

## Screens
![image](https://i.ibb.co/Q8hn3K8/iPhone.png)


## App Store
This App is not available on the App Store.

## Used Technologies
- Swift 5.5
- SwiftUI
- Codable
- JSON
- Combine (for getting JSON data)
- XCTest
### SwiftUI
- Form, Section
- ProgressView
- TabView
- Toggle

## Learnings
### General
- We don't need [Almofire](https://github.com/Alamofire/Alamofire) to make basic network calls
- For creating a loading view with a spinner we now can use the ProgessView() struct in SwiftUI
- A [Gaussian Blur](https://en.wikipedia.org/wiki/Gaussian_blur) can be added to any SwiftUI View with .blur()
- A List can be disabled with .disabled()
- Put the @State vars as @Published into the ViewModel
- [@ObservedObject vs @StateObject](https://medium.com/swlh/understanding-stateobject-in-swiftui-for-ios-14-98c68310154a)
- @StateObject property wrapper persists the value during the rendering of the view
- [Reducers](https://www.hackingwithswift.com/example-code/language/how-to-use-reduce-to-condense-an-array-into-a-single-value) let us reduce values into a single one
- [Trainling clousure syntax can be used, when a closure is the last parameter in a function](https://www.hackingwithswift.com/example-code/language/what-is-trailing-closure-syntax)
### SwiftUI
- Whenever we want to update a view, we need some @State
- [Alerts in iOS15](https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-an-alert)
- @AppStorage is SwiftUI's way of interacting with UserDefaults. It will watch an item in UserDefaults and when that changes
it behaves like a state variable and triggers an UI update.
- [@AppStorage has also its downsides](https://www.avanderlee.com/swift/appstorage-explained/)
- [SwiftUI tips and tricks](https://www.hackingwithswift.com/quick-start/swiftui/swiftui-tips-and-tricks)
### UserDefaults
- Shall ONLY be used for storing some lightweight user preferences! 
- Gets deleted when the App is deleted! So don't save any user critical data in there!
### AsyncImage
- [A simple way to download and render a remote image from a URL](https://wwdcbysundell.com/2021/using-swiftui-async-image/)
- Pros: easy way to asynchronously load and display an Image
- Cons: offers no cachihg of already loaded Images!
### Property Wrappers for handling and passing data
- @State: SwiftUI will manage the state of a struct property separately for us so that it doesn't get destroyed when a struct view gets recreated.
When a @State value changes, the view invalidates is appearance and recomputes the views body. @State is used for private properties that belong
to a specific view and never get used outside of its local scope.
- @StateObject: used to observe an object which conforms to the ObservableObject protocol (eg. viewModel). The body of a view will be recreated
when this object changes.
- @Binding: It connects a property to a source of truth stored elsewhere and can r&w its value.
    - For prototyping, we can use a constant binding: .constant()
- @ObservableObject: used when passing in a value (e.g. viewModel class) from outside (reference) that shall be observed. Get's destroyed when a view gets recreated!
- @EnvironmentObject: used to observe an object which is supplied by a parent view to its ancestor views.
- [Some differences](https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject)
