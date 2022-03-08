//
//  FeedViewController.swift
//  Navigation
//
//  Created by Артем Свиридов on 04.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    let showPost: UIButton = {
        let button = UIButton()

        button.setTitle("Show Post", for: .normal)
        button.setTitleColor(.systemCyan, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    let post = Post(title: "Post Title")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        title = "Feed"

        setConstraints()

        showPost.addTarget(self, action: #selector(showPostTapped), for: .touchUpInside)
    }

    @objc func showPostTapped() {
        let postViewController = PostViewController(post: post)

        navigationController?.pushViewController(postViewController, animated: true)
    }

}

//MARK: SetConstraints

extension FeedViewController {
    func setConstraints() {
        view.addSubview(showPost)
        
        NSLayoutConstraint.activate([
            showPost.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showPost.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showPost.widthAnchor.constraint(equalToConstant: 100),
            showPost.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
