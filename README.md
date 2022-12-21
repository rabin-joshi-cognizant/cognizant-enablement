# Cognizant Enablement

We are excited to propose updates to the existing training program for new associates joining the Cap1 team. As part of this program, we would like to have all candidates complete an assignment. This assignment will help us evaluate their skills and ensure that they are a good fit for the training program.

There are several mandatory features that the application must possess in order to be considered complete. These include:

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



## 2. Combine. (Required)

Build upon #1 above to fetch the data from the network. You can use any publicly available API ([like this one](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/index.html)) to retrieve an array of objects from the network and present them in the table view.  

- Integrate networking with the Reactive Store from #1 above by encapsulating API callbacks in thunks (action creators) by leveraging [ReSwift-Thunk](https://github.com/ReSwift/ReSwift-Thunk).
- Create a Data Task Publisher which publishes the results of fetching data from the given URL.
- Perform tasks such as error-handling and data parsing using Combine operators.
- Use Combine’s `retry(_:)` operator to to immediately retry a failed data task due to transient network errors.
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
- Ensure 85% code coverage. 



## 3. UI Testing (Optional)
- Write UI Tests for testing the view controller logic.




## 4. Accessibility (Optional)
- Voiceover
- Dynamic Type



## 5. Localization (Optional)
- Localize the title (or any other select text).

