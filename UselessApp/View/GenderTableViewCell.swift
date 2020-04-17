//
//  GenderTableViewCell.swift
//  UselessApp
//
//  Created by Eloisa Falcão on 15/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit

class GenderTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var genderDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setup(gender: Gender) {
        name.text = gender.name
        genderDescription.text = gender.description
        flagImage.image = UIImage(named: gender.flagImageName)
    }
    
}
