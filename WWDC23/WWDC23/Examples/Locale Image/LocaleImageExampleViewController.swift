//
//  LocaleImageExampleViewController.swift
//  WWDC23
//
//  Created by StephenFang on 2023/7/13.
//

import UIKit


final class LocaleImageExampleViewController: UIViewController {
    
    private let locales = [
        Locale (languageCode: .arabic),
        Locale (languageCode: .chinese),
        Locale (languageCode: .hindi),
        Locale (languageCode: .hebrew),
        Locale (languageCode: .thai),
        Locale (languageCode: .korean),
        Locale (languageCode: .english),
        Locale (languageCode: .japanese)
    ]
    
    private let imageView: UIImageView = {
        let locale = Locale (languageCode: .chinese)
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        let image = UIImage (
            systemName: "character.textbox",
            withConfiguration: UIImage.SymbolConfiguration(locale: locale)
        )
        imageView.image = image
        return imageView
    }()
    
    private lazy var animatedButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .large
        config.title = "Random Locale"
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonDidClick(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(animatedButton)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            animatedButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func buttonDidClick(_ sender: UIButton) {
        let image = UIImage (
            systemName: "character.textbox",
            withConfiguration: UIImage.SymbolConfiguration(locale: locales.randomElement())
        )
        imageView.image = image
    }
}
