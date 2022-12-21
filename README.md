# CognizantEnablement

## 1. Reactive Store (Required)

#### Assignment:

Create an application using [ReSwift]() to display a list view of items. The application should have the following components:

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


_Note: We have mentioned ReSwift for its ease of use and manageable learning curve. However, you may use any other framework of your chioce for the purpose. The goal here is to demonstrate implementation of a unidirectional data flow architecture. You are therefore free to use any Redux-like framework as long as it enables you to sererate conerns into seperate components: `Action`, `Reducer`, `Store`, `State` etc._



## 2. Combine. (Required)

Build upon #1 above to fetch the data from the network. You can use any publicly available API ([like this one](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/index.html)) to retrieve an array of objects from the network and present them in the table view.  

- Implement networking & data parsing logic in a seperate class.
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
- Write unit tests to test the networking logic.
- Write unit tests to test the view controller.
- Ensure 85% code coverage. 



## 3. UI Testing (Optional)
- Write UI Tests for testing the view controller logic.




## 4. Accessibility (Optional)
- Voiceover
- Dynamic Type



## 5. Localization (Optional)
- Localize the title (or any other select text).

