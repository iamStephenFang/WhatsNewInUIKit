//
//  PaletteMenusExampleViewController.swift
//  WWDC23
//
//  Created by StephenFang on 2023/7/16.
//

import UIKit


final class PaletteMenusExampleViewController: UIViewController {
    
    private let colors: [UIColor] = [
        .red,
        .orange,
        .yellow,
        .green,
        .cyan,
        .blue,
        .purple
    ]
    
    private lazy var paletteButton: UIButton = {
        var iconConfig = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 40))
        
        var buttonConfig = UIButton.Configuration.plain()
        buttonConfig.image = UIImage(systemName: "paintpalette.fill", withConfiguration: iconConfig)?.withRenderingMode(.alwaysOriginal)
        
        let button = UIButton(configuration: buttonConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        // .displayAsPalette
        button.menu = UIMenu(options:[.displayAsPalette], children: colors.map { color in
            let image = UIImage(systemName: "circle.fill")?.withTintColor(color, renderingMode: .alwaysOriginal)
            return UIAction(image: image) { [weak self] _ in
                self?.imageView.image = self?.imageView.image?.withTintColor(color)
            }
          })
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
