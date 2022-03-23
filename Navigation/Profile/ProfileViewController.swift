//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Артем Свиридов on 04.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeader: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.frame = self.view.frame
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
        setView()

        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
    }

    @objc func dismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    private func customizeView() {
        view.backgroundColor = .lightGray
        title = "Profile"
    }

    private func setView() {
        view.addSubview(profileHeader)
    }
}
