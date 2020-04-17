//
//  QuestionsTableViewCell.swift
//  UselessApp
//
//  Created by Eloisa Falcão on 16/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit

class QuestionsTableViewCell: UITableViewCell {

    @IBOutlet weak var question: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(question: String) {
        self.question.text = question
    }
}
