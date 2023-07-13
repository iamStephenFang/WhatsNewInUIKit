//
//  UIDeviceExample.swift
//  WhatsNewInUIKit
//
//  Created by Ferhan Akkan on 10.06.2022.
//

import UIKit

final class UIDeviceExample: UIViewController {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let orientationNotSupportedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private let orientationSupportedLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(orientationNotSupportedLabel)
        stackView.addArrangedSubview(orientationSupportedLabel)
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .vertical
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Synonym for model. Prior to iOS 16, user-assigned device name (e.g. @"My iPhone").
        // In iOS 16 => iPhone 13 Pro Max
        nameLabel.text = "Name = \(UIDevice().name)"
        orientationNotSupportedLabel.text = "Orientation Unsupported= \(UIDevice().orientation)"
        orientationSupportedLabel.text = "Supported way \(preferredInterfaceOrientationForPresentation)"


        // Synonym for model. Prior to iOS 16, user-assigned device name (e.g. @"My iPhone").
        // In iOS 16 => iPhone 13 Pro Max
        UIDevice().name

        //Now UIDevice().orientation now supported use preferredInterfaceOrientationForPresentation
        UIDevice().orientation
        UIViewController().preferredInterfaceOrientationForPresentation

        setLayout()
    }

    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40)
        ])
    }
}
