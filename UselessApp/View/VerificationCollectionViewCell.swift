//
//  VerificationCollectionViewCell.swift
//  UselessApp
//
//  Created by Eloisa Falcão on 17/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit

class VerificationCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var check: UIImageView!
    var hadBeenSelected: Bool = false

    func select() {
        if hadBeenSelected == true {
            hadBeenSelected = false
            check.image = nil
        } else {
            hadBeenSelected = true
            check.image = UIImage(named: "check")
        }
    }
}
