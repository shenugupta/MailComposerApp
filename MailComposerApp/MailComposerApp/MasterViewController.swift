//
//  MasterViewController.swift
//  ExampleApp
//
//  Created by Rajdeep Kwatra on 2/1/20.
//  Copyright © 2020 Rajdeep Kwatra. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit

struct Navigation {
    let title: String
    let items: [NavigationItem]
}

struct NavigationItem {
    let title: String
    let viewController: UIViewController
}

class MasterViewController: UITableViewController {

    let navigation = [
        Navigation(title: "Attachment", items: [
            NavigationItem(title: "Match Content", viewController: MatchContentAttachmentExampleViewController()),
        ]),
        Navigation(title: "Advanced features", items: [
            NavigationItem(title: "Commands", viewController: CommandsExampleViewController())
                    ])
    ]
           
      


    override func viewWillAppear(_ animated: Bool) {
        //clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return navigation.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        navigation[section].title
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return navigation[section].items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = navigation.item(at: indexPath).title
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = navigation.item(at: indexPath)
        let viewController = item.viewController
        viewController.title = item.title
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


extension Array where Element == Navigation {
    func item(at indexPath: IndexPath) -> NavigationItem {
        return self[indexPath.section].items[indexPath.row]
    }
}
