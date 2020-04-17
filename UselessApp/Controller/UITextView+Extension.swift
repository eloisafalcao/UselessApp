//
//  UITextViewExtension.swift
//  UselessApp
//
//  Created by Eloisa Falcão on 17/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit

extension UITextView {

    func numberOfLines() -> Int{
        if let fontUnwrapped = self.font {
            return Int(self.contentSize.height / fontUnwrapped.lineHeight)
        }
        return 0
    }
}
