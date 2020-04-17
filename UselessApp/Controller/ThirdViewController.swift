//
//  ThirdViewController.swift
//  UselessApp
//
//  Created by Eloisa Falcão on 17/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var genderMenu: MenuDropDown!
    @IBOutlet weak var domainDropDown: MenuDropDown!
    @IBOutlet weak var orgDropDown: MenuDropDown!

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func done(_ sender: Any) {
    }


    @IBAction func erase(_ sender: Any) {
    }
}
