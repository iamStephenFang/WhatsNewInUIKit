//
//  SelfResizingCollectionViewCell.swift
//  WhatsNewInUIKit
//
//  Created by Ferhan Akkan on 10.06.2022.
//

import UIKit

final class SelfResizingCollectionViewCell: UICollectionViewCell {

    struct Constants {
        static let longText = "Lourem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia ,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo atem."
        static let shortText = "Lorem ipsum"
    }

    private let label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .orange
        view.numberOfLines = 0
        view.textAlignment = .center
        view.text = Constants.shortText
        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .orange
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(expandButton)
        stackView.addArrangedSubview(collapseButton)
        stackView.addArrangedSubview(expandWithoutAnimationButton)
        stackView.addArrangedSubview(collapseWithoutAnimationButton)
        return stackView
    }()

    private lazy var expandButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.setTitle("Expand", for: .normal)
        button.addTarget(self, action: #selector(didTapExpandButton), for: .touchUpInside)
        return button
    }()

    private lazy var collapseButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.setTitle("Collapse", for: .normal)
        button.addTarget(self, action: #selector(didTapCollapseButton), for: .touchUpInside)
        return button
    }()

    private lazy var expandWithoutAnimationButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.setTitle("Expand Without Animation", for: .normal)
        button.addTarget(self, action: #selector(didTapExpandWithoutAnimationButton), for: .touchUpInside)
        return button
    }()

    private lazy var collapseWithoutAnimationButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.setTitle("Collapse Without Animation", for: .normal)
        button.addTarget(self, action: #selector(didTapCollapseWithoutAnimationButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .black
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true

        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func didTapExpandWithoutAnimationButton() {
        label.text = Constants.longText
        UIView.performWithoutAnimation {
            self.invalidateIntrinsicContentSize()
        }
    }

    @objc private func didTapCollapseWithoutAnimationButton() {
        label.text = Constants.shortText
        UIView.performWithoutAnimation {
            self.invalidateIntrinsicContentSize()
        }
    }

    @objc private func didTapExpandButton() {
        label.text = Constants.longText
    }

    @objc private func didTapCollapseButton() {
        label.text = Constants.shortText
    }
}
