//
//  PaletteMenusExampleViewController.swift
//  WWDC23
//
//  Created by StephenFang on 2023/7/16.
//

import UIKit


class PaletteMenusExampleViewController: UIViewController {
    
    private lazy var paletteButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .large
        config.title = "Palette Picker"
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.menu = UIMenu(options:[.displayAsPalette], children: [
            UIAction(image: UIImage(systemName: "circle.fill")?.withTintColor(.red).withRenderingMode(.alwaysOriginal), handler: {[weak self] _ in
                self?.imageView.image = self?.imageView.image?.withTintColor(.red)
            }),
            UIAction(image: UIImage(systemName: "circle.fill")?.withTintColor(.yellow).withRenderingMode(.alwaysOriginal), handler: {[weak self] _ in
                self?.imageView.image = self?.imageView.image?.withTintColor(.yellow)
            }),
            UIAction(image: UIImage(systemName: "circle.fill")?.withTintColor(.green).withRenderingMode(.alwaysOriginal), handler: {[weak self] _ in
                self?.imageView.image = self?.imageView.image?.withTintColor(.green)
            }),
            UIAction(image: UIImage(systemName: "circle.fill")?.withTintColor(.blue).withRenderingMode(.alwaysOriginal), handler: {[weak self] _ in
                self?.imageView.image = self?.imageView.image?.withTintColor(.blue)
            })
        ])
        button.showsMenuAsPrimaryAction = true
        return button
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "paintpalette.fill")?.withRenderingMode(.alwaysOriginal))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(paletteButton)
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
            paletteButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
