//
//  ViewController.swift
//  CognizantEnablement
//
//  Created by Rabin Joshi on 2022-12-21.
//

import ReSwift
import UIKit

class ViewController: UITableViewController, StoreSubscriber {

    typealias StoreSubscriberStateType = AppState

    var arr = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        mainStore.subscribe(self)
        mainStore.dispatch(AppAction.fetchAll)
    }

    func newState(state: AppState) {
        arr = mainStore.state.arr
        tableView.reloadData()
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
}

class API {

    func fetchAudiobooks() {}
}
