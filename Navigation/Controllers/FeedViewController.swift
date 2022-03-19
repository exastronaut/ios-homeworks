//
//  FeedViewController.swift
//  Navigation
//
//  Created by Артем Свиридов on 04.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()

    private let showFirstPost: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("First post", for: .normal)
        button.addTarget(self, action: #selector(showPostTapped), for: .touchUpInside)
        return button
    }()

    private let showSecondPost: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Second post", for: .normal)
        button.addTarget(self, action: #selector(showPostTapped), for: .touchUpInside)
        return button
    }()

    let post = Post(title: "Post Title")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        title = "Feed"

        layout()
    }

    @objc func showPostTapped() {
        let postViewController = PostViewController(post: post)
        
        navigationController?.pushViewController(postViewController, animated: true)
    }

    private func layout() {
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        [showFirstPost, showSecondPost].forEach { stackView.addArrangedSubview($0) }
    }

}
