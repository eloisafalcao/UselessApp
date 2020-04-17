//
//  NotARobotViewController.swift
//  UselessApp
//
//  Created by Eloisa Falcão on 16/04/20.
//  Copyright © 2020 Eloisa Falcão. All rights reserved.
//

import UIKit

class NotARobotViewController: UIViewController {

    @IBOutlet weak var check: UIImageView!
    @IBOutlet weak var modalView: ModalView!
    @IBOutlet weak var collectionView: UICollectionView!
    var images = [String]()
    var IDENTIFIER = "VerificationCollectionViewCell"


    override func viewDidLoad() {
        super.viewDidLoad()
        setupTapCheck()

        collectionView.delegate = self
        collectionView.dataSource = self

        for i in 0...9 {
            images.append("glass\(i)")
        }

    }

    func setupTapCheck() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        check.addGestureRecognizer(tap)
        check.isUserInteractionEnabled = true
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        //        check.image = UIImage(named: "check")
        modalView.animateModal()
    }
}

extension NotARobotViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IDENTIFIER, for: indexPath) as? VerificationCollectionViewCell
        cell?.image.image = UIImage(named: images[indexPath.row])
        return cell ?? VerificationCollectionViewCell()
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tap")
    }
}

