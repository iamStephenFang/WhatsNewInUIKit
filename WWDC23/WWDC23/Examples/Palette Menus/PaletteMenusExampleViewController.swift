//
//  PaletteMenusExampleViewController.swift
//  WWDC23
//
//  Created by StephenFang on 2023/7/16.
//

import UIKit


class PaletteMenusExampleViewController: UIViewController {
    
    private lazy var paletteButton: UIButton = {
        var iconConfig = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 40))
        
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.image = UIImage(systemName: "paintpalette.fill", withConfiguration: iconConfig)?.withRenderingMode(.alwaysOriginal)
        
        let button = UIButton(configuration: buttonConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // .displayAsPalette
        button.menu = UIMenu(options:[.displayAsPalette], children: [
            UIAction(image: UIImage(systemName: "circle.fill")?.withTintColor(.red, renderingMode: .alwaysOriginal), handler: {[weak self] _ in
                self?.imageView.image = self?.imageView.image?.withTintColor(.red)
            }),
            UIAction(image: UIImage(systemName: "circle.fill")?.withTintColor(.orange, renderingMode: .alwaysOriginal), handler: {[weak self] _ in
                self?.imageView.image = self?.imageView.image?.withTintColor(.orange)
            }),
            UIAction(image: UIImage(systemName: "circle.fill")?.withTintColor(.yellow, renderingMode: .alwaysOriginal), handler: {[weak self] _ in
                self?.imageView.image = self?.imageView.image?.withTintColor(.yellow)
            }),
            UIAction(image: UIImage(systemName: "circle.fill")?.withTintColor(.green, renderingMode: .alwaysOriginal), handler: {[weak self] _ in
                self?.imageView.image = self?.imageView.image?.withTintColor(.green)
            }),
            UIAction(image: UIImage(systemName: "circle.fill")?.withTintColor(.cyan, renderingMode: .alwaysOriginal), handler: {[weak self] _ in
                self?.imageView.image = self?.imageView.image?.withTintColor(.cyan)
            }),
            UIAction(image: UIImage(systemName: "circle.fill")?.withTintColor(.blue, renderingMode: .alwaysOriginal), handler: {[weak self] _ in
                self?.imageView.image = self?.imageView.image?.withTintColor(.blue)
            }),
            UIAction(image: UIImage(systemName: "circle.fill")?.withTintColor(.purple, renderingMode: .alwaysOriginal), handler: {[weak self] _ in
                self?.imageView.image = self?.imageView.image?.withTintColor(.purple)
            })
        ])
        button.showsMenuAsPrimaryAction = true
        return button
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "paintbrush.fill")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal))
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
