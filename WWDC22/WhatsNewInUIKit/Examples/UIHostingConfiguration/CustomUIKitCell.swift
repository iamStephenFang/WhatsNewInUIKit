//
//  CustomUIKitCell.swift
//  WhatsNewInUIKit
//
//  Created by Ferhan Akkan on 10.06.2022.
//

import UIKit

final class CustomUIKitCell: UITableViewCell {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        return label
    }()

    let sparklesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with contentData: ContentData) {
        titleLabel.text = contentData.title
        descriptionLabel.text = contentData.description
        sparklesImageView.image = .init(systemName: contentData.imageName)
    }

    private func setLayout() {
        contentView.addSubview(sparklesImageView)
        NSLayoutConstraint.activate([
            sparklesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            sparklesImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            sparklesImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            sparklesImageView.widthAnchor.constraint(equalToConstant: 40),
            sparklesImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 40)
        ])

        contentView.addSubview(titleLabel)
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: sparklesImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10)
        ])

        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: sparklesImageView.trailingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
