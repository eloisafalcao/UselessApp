//
//  MenuViewController.swift
//  UselessApp
//
//  Created by Eloisa Falcão on 16/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!

    var clickCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialStatelabels()
    }

    func setupInitialStatelabels() {
        let labels = [label1, label2, label3, label4]
        for label in labels {
            label?.isHidden = true
        }
    }

    @IBAction func noButtonClick(_ sender: Any) {
        switch clickCount {
        case 0:
            label1.isHidden = false
            clickCount+=1
        case 1:
            label2.isHidden = false
            clickCount+=1
        case 2:
            label3.isHidden = false
            clickCount+=1
        case 3:
            label4.isHidden = false
            clickCount+=1
        default:
            break
        }
    }
}
