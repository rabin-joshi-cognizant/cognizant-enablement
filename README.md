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
Implement networking logic using Combine. 
- Build on top of Feature 1 above to now fetch the array from the network. 
- You can use any publicky available API to retrieve an array of objects and present them in the table view.  



## 3. Unit Tests (Required)
- Write unit tests for all the classes/stucts. 
- Ensure 85% code coverage. 



## 3. UI Testing (Optional)
- Write UI Tests for testing the view controller logic.




## 4. Accessibility (Optional)
- Voiceover
- Dynamic Type



## 5. Localization (Optional)
- Localize the title (or any other select text).

