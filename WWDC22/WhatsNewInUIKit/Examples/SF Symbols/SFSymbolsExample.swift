//
//  SFSymbolsExample.swift
//  WhatsNewInUIKit
//
//  Created by Ferhan Akkan on 10.06.2022.
//

import UIKit

// Before iOS 16 monochrome was default configuration but now its Hieararchical.
// UIImage.SymbolConfiguration.configurationPreferringMonochrome() to be Monochrome

final class SFSymbolsExample: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(
            systemName: "wifi",
            variableValue: 0.0,
            configuration: UIImage.SymbolConfiguration(paletteColors: [.orange])
        )
        imageView.image = image
        return imageView
    }()

    private lazy var sliderView: UISlider = {
        let sliderView = UISlider()
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        sliderView.setValue(0, animated: false)
        sliderView.minimumValue = 0
        sliderView.maximumValue = 1
        sliderView.addTarget(self, action: #selector(sliderDidValueChange(_:)), for: .valueChanged)
        return sliderView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(sliderView)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            sliderView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }

    @objc private func sliderDidValueChange(_ sender: UISlider) {
        imageView.image = UIImage(
            systemName: "wifi",
            variableValue: Double(sender.value),
            configuration: UIImage.SymbolConfiguration(paletteColors: [.orange])
        )
    }
}
