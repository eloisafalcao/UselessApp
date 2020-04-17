//
//  ModalView.swift
//  UselessApp
//
//  Created by Eloisa Falcão on 16/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit

class ModalView: UIView {
    
    override func draw(_ rect: CGRect) {
        self.isHidden = true
        self.frame = CGRect(x: 85, y: 216, width: 0, height: 0)

    }

    func animateModal() {
        self.isHidden = false
        UIView.animate(withDuration: 0.3) {
            self.frame = CGRect(x: 20, y: 264, width: 374, height: 598)
        }
    }
}
