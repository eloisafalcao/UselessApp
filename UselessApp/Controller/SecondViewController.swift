//
//  SecondViewController.swift
//  UselessApp
//
//  Created by Eloisa Falcão on 17/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit

protocol AreaCodeProtocol {
    func checkForAreaCode() -> Bool
}

protocol BirthProtocol {
    func getBirth()-> Date
    func matchBirthAndAge() -> Bool
    func checkCharacters()-> Bool
}

class SecondViewController: UIViewController {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var cellphoneTextField: UITextField!
    @IBOutlet weak var birthMonthTextField: UITextField!
    @IBOutlet weak var birthDayTextField: UITextField!
    @IBOutlet weak var birthYearTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var areaCodeError: UILabel!
    @IBOutlet weak var ageError: UILabel!
    @IBOutlet weak var age: UILabel!

    var ageValue = 0
    var textFields = [UITextField]()

    var areaCodeErrorText = ["Am I supoused to find out your area code?",
                             "There's suppoused to be more digits in your numer, pal",
                             "Do you known what area code means?"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        areaCodeError.isHidden = true
        ageError.isHidden = true
        hideKeyboardWhenTappedAround()
        textFields = [phoneTextField,
                      cellphoneTextField,
                      birthMonthTextField,
                      birthDayTextField,
                      birthYearTextField]

        textFields.forEach { (textField) in
            textField.keyboardType = UIKeyboardType.numberPad
        }
    }


    @IBAction func didChangeValue(_ sender: UISlider) {
        ageValue = Int(sender.value)
        age.text = String(ageValue)
    }

    @IBAction func done(_ sender: Any) {

        if checkForAreaCode(), matchBirthAndAge() {
            let vc = storyboard?.instantiateViewController(identifier: "ThirdViewController") ?? UIViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func erase(_ sender: Any) {
        textFields.forEach { (textField) in
            textField.text = ""
        }
        passwordTextField.text = ""
        age.text = "0"
        areaCodeError.isHidden = true
        ageError.isHidden = true
        ageSlider.value = 0
    }
}

extension SecondViewController: BirthProtocol {

    func checkCharacters()-> Bool {

        let birthDay = Int(birthDayTextField.text ?? "1") ?? 1
        let birthMonth = Int(birthMonthTextField.text ?? "1") ?? 1

        if birthDay<1 || birthDay>31 || birthMonth<1 || birthMonth>12 {
            ageError.isHidden = false
            ageError.text = "That's not a valid birth"
            return false
        }
        
        ageError.isHidden = true
        return true
    }

    func getBirth() -> Date {

        if let birthMonthTextFieldText = birthMonthTextField.text,

            let birthDayTextFieldText = birthDayTextField.text,
            let birthYearTextFieldText = birthYearTextField.text {

            var dateComponents = DateComponents()
            dateComponents.month = Int(birthMonthTextFieldText)
            dateComponents.day = Int(birthDayTextFieldText)
            dateComponents.year = Int(birthYearTextFieldText)

            let calendar = Calendar.current
            let date = calendar.date(from: dateComponents)

            return date ?? Date()
        }

        return Date()
    }

    func matchBirthAndAge() -> Bool {

        if checkCharacters() {
            let currentDate = Date()
            let birth: Date = getBirth()
            let calendar = Calendar.current

            let ageComponents = calendar.dateComponents([.day, .month, .year], from: birth, to: currentDate)
            let userAge = ageComponents.year!

            if userAge != ageValue {
                ageError.isHidden = false
                ageError.text = "Age and birth don't match, Benjamin Button"
                return false
            } else {
                ageError.isHidden = true
                return true
            }
        }
        return false
    }
}

extension SecondViewController: AreaCodeProtocol {

    func checkForAreaCode() -> Bool {
        guard let cellphoneTextFieldText = cellphoneTextField.text, let phoneTextFieldText = phoneTextField.text else { return  false}

        if phoneTextFieldText.count<8 {
            areaCodeError.isHidden = false
            areaCodeError.text = "What kind of phone number just has \(phoneTextFieldText.count) digits?"
            return false
        }

        if cellphoneTextFieldText.count<9 {
            areaCodeError.isHidden = false
            areaCodeError.text = "What kind of cellphone number just has \(cellphoneTextFieldText.count) digits?"
            return false
        }

        if cellphoneTextFieldText.count>=9 && cellphoneTextFieldText.count<11 {
            areaCodeError.isHidden = false
            areaCodeError.text = areaCodeErrorText.randomElement()
            return false
        }

        if phoneTextFieldText.count>=8 && phoneTextFieldText.count<10 {
            areaCodeError.isHidden = false
            areaCodeError.text = areaCodeErrorText.randomElement()
            return false
        }

        areaCodeError.isHidden = true
        return true
    }
}

