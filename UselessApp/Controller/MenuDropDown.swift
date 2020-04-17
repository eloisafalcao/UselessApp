//
//  MenuDropDown.swift
//  UselessApp
//
//  Created by Eloisa Falcão on 16/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit

protocol SelectedQuestionDelegate {
    func set(selectedQuestion: String)
}

class MenuDropDown: UIView {

    var delegate: SelectedQuestionDelegate?
    var tableView: UITableView?
    var menuViewHeight: NSLayoutConstraint?
    var isDropDownPresent = false
    var IDENTIFIER = "QuestionsTableViewCell"
    var questions = ["What the meaning of life?",
                     "How to start a family?",
                     "What does the fox say?",
                     "Why this questions are so random?",
                     "Why are you tring to finish this form?"]

    func setup(tableView: UITableView, menuViewHeight: NSLayoutConstraint) {
        self.tableView = tableView
        self.menuViewHeight = menuViewHeight

        menuViewHeight.constant = 72
        self.layoutIfNeeded()

        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
        tableView.isUserInteractionEnabled = true
        tableView.isHidden = true
    }

    func showDropDown() {
        guard let tableView = tableView, let menuViewHeight = menuViewHeight  else { return }
        tableView.isHidden = !tableView.isHidden
        UIView.animate(withDuration: 0.3) {
            menuViewHeight.constant = tableView.isHidden ? 72 : 280
            self.setNeedsLayout()
        }
    }
}

extension MenuDropDown: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER) as?  QuestionsTableViewCell
        cell?.setup(question: questions[indexPath.row])
        return cell ?? QuestionsTableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.set(selectedQuestion: questions[indexPath.row])
        showDropDown()
    }
}
