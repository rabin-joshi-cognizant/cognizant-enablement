# Cognizant Enablement

As part of the Enablement Training, candidates are asked to complete an assignment of building an iOS application individually and from scratch. There are several mandatory features that the application must possess in order to be considered complete. These include:

- Demonstration of unidirectional data flow architecture (using a framework such as [ReSwift](https://github.com/ReSwift/ReSwift) or [TCA](https://github.com/pointfreeco/swift-composable-architecture)).
- Demonstration of Combine, Apple's new framework for reactive programming.
- Demonstration of unit testing, including how to write and run tests for your code.

In addition to these mandatory features, there are several optional features that would be nice to have, but are not required. These include:
- UI testing, including how to set up and run tests for your user interface.
- Localization, including the ability to translate your app into different languages.
- Accessibility, including the ability to make your app usable for people with disabilities.

We have expanded upon each of these requirements below: 

## 1. Reactive Store (Required)

Create an application using [ReSwift](https://github.com/ReSwift/ReSwift) to display a list view of items. The application should have the following components:

Actions:
- Create an action to fetch the elements of the list.
- Actions shouldn't contain any code, they should be consumed by the store and forwarded to reducers. 

Reducer:
- Create a reducer to handle the actions.
- The reducer should update the state of the list.
- The reducer should provide pure functions, that based on the current action and the current app state, creates a new app state

State:
- Create single data structure to represent the entire app state.

Store:
- Create a store to hold the state of the list

UI:
- Create a table view to display the items in the list.


_Note: We have mentioned [ReSwift](https://github.com/ReSwift/ReSwift) for its ease of use and manageable learning curve. However, you may use any other framework of your chioce for the purpose. The goal here is to demonstrate implementation of a unidirectional data flow architecture. You are therefore free to use any Redux-like framework as long as it enables you to sererate conerns into seperate components: `Action`, `Reducer`, `Store`, `State` etc._

#### Example

Here's an example of a simple Reactive Store implementation from the companion project in this repository. It implements a single `fetchAll` action that updates the state with an array of Strings.

```swift
import ReSwift

// The global application store, which is responsible for managing the appliction state.
let mainStore = Store<AppState>(
    reducer: reducer,
    state: nil
)

// The reducer is responsible for evolving the application state based on the actions it receives.
func reducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    switch action {
    case AppAction.fetchAll:
        state.arr = ["James", "Robert", "John", "Michael", "David"]
    default:
        break
    }
    return state
}

// The entire app state is explicitly stored in this data structure.
struct AppState {
    var arr: [String] = []
}

// All of the actions that can be applied to the state
enum AppAction: Action {
    case fetchAll
}

```

## 2. Combine. (Required)

Build upon #1 above to fetch the data from the network. You can use any publicly available API ([like this one](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/index.html)) to retrieve an array of objects from the network and present them in the table view.  

- Integrate networking with the Reactive Store from #1 above by encapsulating API callbacks in thunks (action creators) by leveraging [ReSwift-Thunk](https://github.com/ReSwift/ReSwift-Thunk).
- Create a Data Task Publisher which publishes the results of fetching data from the given URL.
- Perform tasks such as error-handling and data parsing using Combine operators.
- Use Combine???s `retry(_:)` operator to to immediately retry a failed data task due to transient network errors.
- Use Combine's `catch(_:)` or `replaceError(with:)` operator to gracefully handle errors, rather than letting it reach the subscriber.
- Use Combine's `share()` operator to avoid needlessly reissuing expensive network requests.



#### Example
Here's an example demonstrating fetching and decoding of JSON data from a URL endpoint.

```swift
/// Processing URL Session Data Task Results with Combine
/// https://developer.apple.com/documentation/foundation/urlsession/processing_url_session_data_task_results_with_combine

struct User: Codable {
    let name: String
    let userID: String
}
let url = URL(string: "https://example.com/endpoint")!
cancellable = urlSession
    .dataTaskPublisher(for: url)
    .tryMap() { element -> Data in
        guard let httpResponse = element.response as? HTTPURLResponse,
            httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
        return element.data
        }
    .decode(type: User.self, decoder: JSONDecoder())
    .sink(receiveCompletion: { print ("Received completion: \($0).") },
          receiveValue: { user in print ("Received user: \(user).")})
```


## 3. Unit Tests (Required)
- Write unit tests to test the actions, reducer, and store.
- Write unit tests to test the networking logic (ActionCreator/Thunk).
- Write unit tests to test the view controller.
    - It should try and cover majority of methods and properties
    - It should try and cover majority of the conditions and loops
    - Moc data can be used for data and network coverage.
    - Ensure 85% code coverage.




## 3. UI Testing (Optional)
- Write UI Tests for testing the functional flow logic
    - It should cover all the happy paths
    - It should try and cover majority of the error/unhappy paths





## 4. Accessibility (Optional)
- Provide/update accessibility properties for elements in the application 
    - Can be implemented in storyboard or programmatically. Note - lookout for  has changes in xcode 13 and above.
    -  Implement at least 2 main two properties like accessibility identifier, label. 
    - Use of accessibility inspector to inspect accessibility properties
    - Demo of voice over is optional if device is available



## 5. Localization (Optional)
- Implement localization
    - User localizable string file and NSlocalizedString.
    - Add a language of your choice


