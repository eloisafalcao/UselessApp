//
//  GenderTableView.swift
//  UselessApp
//
//  Created by Eloisa Falcão on 15/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit

class GenderTableViewController: UITableViewController {

    let genders: [Gender] = []
    let IDENTIFIER = "GenderTableViewCell"

    override func viewDidLoad() {
        tableView.register(UINib(nibName: IDENTIFIER, bundle: nil), forCellReuseIdentifier: IDENTIFIER)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genders.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER) as? GenderTableViewCell
        cell?.setup(gender: genders[indexPath.row])
        
        return cell ?? GenderTableViewCell()
    }
}
