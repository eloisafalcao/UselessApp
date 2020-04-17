//
//  FormManager.swift
//  UselessApp
//
//  Created by Eloisa Falcão on 16/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import Foundation

extension String {
    public static var fullName = "fullName"
    public static var securityQuestion = "securityQuestion"
    public static var securityAnswer = "securityAnswer"
}

class FormManager {

    static var shared = FormManager()
    let defaults = UserDefaults()

    var fullName: String?

    private init() {}

    func setFullName(fullName: String) {
        self.fullName = fullName
    }

//    func set(lunchTime: String) {
//        self.lunchTime = lunchTime
//    }
//
//    func set(categories: [String]) {
//        self.categories = categories
//    }
//
//    func set(hours: Int, mins: Int) {
//        self.hours = hours
//        self.mins = mins
//        defaults.set(hours, forKey: .fullName)
//         defaults.set(mins, forKey: UserDefaultsKeyHelper.mins.rawValue)
//     }
//
//    func set(price: Int) {
//        self.price = price
//    }
//
//    func setLunchTime() {
//        defaults.set(lunchTime, forKey: UserDefaultsKeyHelper.lunchTime.rawValue)
//    }
//
//    func setCategories() {
//        defaults.set(categories, forKey: UserDefaultsKeyHelper.categories.rawValue)
//    }
//
//    func setPrice() {
//        defaults.set(price, forKey: UserDefaultsKeyHelper.price.rawValue)
//
//    }
//
//    func setData() {
//        setLunchTime()
//        setPrice()
//        setCategories()
//    }
//
//    func getData() -> (String, [String], Int) {
//        let udTimeValue = defaults.string(forKey: UserDefaultsKeyHelper.lunchTime.rawValue ) ?? String()
//        let udPriceValue = defaults.integer(forKey: UserDefaultsKeyHelper.price.rawValue)
//        let udCategories = defaults.array(forKey: UserDefaultsKeyHelper.categories.rawValue) as? [String] ?? [""]
//
//        return(udTimeValue, udCategories, udPriceValue)
//    }
//
//    func getCategories() -> [String]? {
//        let udCategories = defaults.array(forKey: UserDefaultsKeyHelper.categories.rawValue) as? [String]
//        return udCategories
//    }

//    func getPrice() -> Int {
//        let udPriceValue = defaults.integer(forKey: UserDefaultsKeyHelper.price.rawValue)
//        return udPriceValue
//    }

//    func lunchTimeDateComponents() -> DateComponents {
//        var dateComponents = DateComponents()
//        dateComponents.hour = hours
//        dateComponents.minute = mins
//        return dateComponents
//    }
}
