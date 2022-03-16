//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Артем Свиридов on 04.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeader = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        title = "Profile"

        view.addSubview(profileHeader)

        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)

    }

    @objc func dismissKeyboard(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        profileHeader.frame = view.frame
    }
    
}
