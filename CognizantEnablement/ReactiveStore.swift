//
//  ReactiveStore.swift
//  CognizantEnablement
//
//  Created by Rabin Joshi on 2022-12-21.
//

import ReSwift

// The global application store, which is responsible for managing the appliction state.
let mainStore = Store<AppState>(
    reducer: reducer,
    state: nil
)


// The reducer is responsible for evolving the application state based
// on the actions it receives
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
