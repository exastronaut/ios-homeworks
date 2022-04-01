//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Артем Свиридов on 04.03.2022.
//
import UIKit

class ProfileViewController: UIViewController {
    //MARK: - Properties
    private let profileHeaderView: ProfileHeaderView = {
        let profile = ProfileHeaderView()
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()

    private let newButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("New button", for: .normal)
        return button
    }()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        customizeView()
        layout()
    }
    //MARK: - Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let _ = touches.first {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event)
    }

    private func customizeView() {
        view.backgroundColor = .lightGray
        title = "Profile"
    }

    private func layout() {

        [profileHeaderView, newButton].forEach { view.addSubview($0) }

        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            newButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor),
            newButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor),
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
