//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Артем Свиридов on 14.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    private var statusText: String?

    let profileImage: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(
            origin: .zero,
            size: CGSize(
                width: 100,
                height: 100))
        image.image = UIImage(named: "avatar")
        image.clipsToBounds = true
        image.layer.cornerRadius = image.frame.width / 2
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()

    let showStatus: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    let profileName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Zhong Xina"
        label.textColor = .black
        return label
    }()

    let status: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Waiting for something..."
        label.textColor = .gray
        return label
    }()

    let editStatus: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField

    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        addSubview(profileImage)
        addSubview(showStatus)
        addSubview(profileName)
        addSubview(status)
        addSubview(editStatus)
    }

    @objc func buttonPressed() {
        guard let text = editStatus.text, !text.isEmpty else {
            status.text = "Waiting for something..."
            return
        }
        status.text = statusText
        editStatus.text = ""
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        profileImage.frame.origin = CGPoint(
            x: 16,
            y: Int(self.safeAreaInsets.top) + 16)

        showStatus.frame = CGRect(
            x: 16,
            y: Int(profileImage.frame.maxY) + 26,
            width: Int(self.frame.width) - 32,
            height: 50)

        profileName.frame = CGRect(
            x: Int(profileImage.frame.maxX) + 16,
            y: Int(self.safeAreaInsets.top) + 27,
            width: Int(self.frame.width) - 148,
            height: 20)

        status.frame = CGRect(
            x: Int(profileImage.frame.maxX) + 16,
            y: Int(showStatus.frame.minY) - 64,
            width: Int(self.frame.width) - 148,
            height: 16)

        editStatus.frame = CGRect(
            x: Int(profileImage.frame.maxX) + 16,
            y: Int(status.frame.maxY) + 4,
            width: Int(self.frame.width) - 148,
            height: 40)
    }
}
