# CognizantEnablement

## Level 1: Reactive Store

Goal: Demonstrate unidirectional data flow architecture in Swift using the ReSwift framework. 

Separate the app logic into the following components:

- **State**: Represents the entire app state in a single data structure. 
- **Store**: Stores the app state. This state can only be modified by dispatching Actions to the store. Whenever the state in the store changes, the store will notify all observers.
- **Actions**: Declare all possible state change as an emum. Actions shouldn't contain any code, they are consumed by the store and forwarded to reducers. 
- **Reducer**: Handle the actions by implementing a different state change for each action. Reducers provide pure functions, that based on the current action and the current app state, create a new app state

## Level 1: Reactive Store
