//
//  FirstViewController.swift
//  UselessApp
//
//  Created by Eloisa Falcão on 16/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit

protocol FullNameDelegate {
    func checkNameCharacterCount() -> Bool
}

protocol SecurityAnswerDelegate {
    func checkLineCount() -> Bool
}

class FirstViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameErrorLabel: UILabel!
    @IBOutlet weak var answerErrorLabel: UILabel!
    @IBOutlet weak var menuDropDown: MenuDropDown!
    @IBOutlet weak var selectedQuestion: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dorpDownButton: UIButton!
    @IBOutlet weak var menuDropDownHeight: NSLayoutConstraint!
    @IBOutlet weak var securityAnnswer: UITextView!

    let nameErrorWarnings = ["your FULL name",
                             "is your name that short?",
                             "I've saw ducks bigger than that name"]
    let answerErrorWarnings = ["ate least 3 lines, baby",
                               "let's count! 1, 2, 3 LINES!",
                               "to proceed, please, insert 3 lines in the answer box, thank u"]

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        menuDropDown.setup(tableView: tableView, menuViewHeight: menuDropDownHeight)
        menuDropDown.delegate = self
        setupTap()
    }

    func setupSecurityAnswer() {
        securityAnnswer.layer.shadowColor = UIColor.black.cgColor
        securityAnnswer.layer.shadowOpacity = 0.2
        securityAnnswer.layer.shadowOffset = .zero
        securityAnnswer.layer.shadowRadius = 8
        securityAnnswer.layer.cornerRadius = 10
    }

    func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        selectedQuestion.addGestureRecognizer(tap)
        selectedQuestion.isUserInteractionEnabled = true
    }

    @IBAction func done(_ sender: Any) {
        if checkNameCharacterCount(), checkLineCount() {
            let vc = storyboard?.instantiateViewController(identifier: "SecondViewController") ?? UIViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    @IBAction func touchDownTextField(_ sender: Any) {
    }

    @IBAction func dropDownButton(_ sender: Any) {
        menuDropDown.showDropDown()
        dorpDownButton.layoutIfNeeded()
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        menuDropDown.showDropDown()
    }
}

extension FirstViewController: FullNameDelegate {

    func checkNameCharacterCount() -> Bool {
        guard let nameTextFieldText = nameTextField.text else { return false }

        if nameTextFieldText.count<10 {
            nameErrorLabel.isHidden = false
            nameErrorLabel.text = nameErrorWarnings.randomElement()
            return false
        }
        nameErrorLabel.isHidden = true
        return true
    }
}

extension FirstViewController: SelectedQuestionDelegate {
    func set(selectedQuestion: String) {
        self.selectedQuestion.text = selectedQuestion
    }
}

extension FirstViewController: SecurityAnswerDelegate {

    func checkLineCount() -> Bool {
        if securityAnnswer.numberOfLines()<3 {
            answerErrorLabel.isHidden = false
            answerErrorLabel.text = answerErrorWarnings.randomElement()
            return false
        }
        answerErrorLabel.isHidden = true
        return true
    }
}
