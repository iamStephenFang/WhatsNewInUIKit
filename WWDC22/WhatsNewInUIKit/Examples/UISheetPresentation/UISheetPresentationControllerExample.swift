//
//  UISheetPresentationControllerExample.swift
//  WhatsNewInUIKit
//
//  Created by Ferhan Akkan on 10.06.2022.
//

import UIKit

extension UISheetPresentationController.Detent.Identifier {
    static let developerDefiened = UISheetPresentationController.Detent.Identifier("developerDefiened")
}

final class UISheetPresentationControllerExample: UIViewController {

    private var multiplier: Double = 0.3

    private lazy var slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0.3
        slider.setValue(Float(multiplier), animated: false)
        slider.maximumValue = 1
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        return slider
    }()

    private lazy var button: UIButton = {
        let button = UIButton(primaryAction: .init(title: "Present Bottom Sheet", handler: {_ in
            self.presentBottomSheet()
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }

    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        view.addSubview(slider)
        NSLayoutConstraint.activate([
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            slider.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20)
        ])
    }

    private func presentBottomSheet() {
        let vc = SFSymbolsExample()
        vc.view.backgroundColor = .white
        guard let sheet = vc.sheetPresentationController else {
            return
        }

       //  sheet.largestUndimmedDetentIdentifier = .developerDefiened - You can add if clear background.

        sheet.detents = [
            .custom(identifier: .developerDefiened) { context in
                context.maximumDetentValue * self.multiplier
            }
        ]
        self.present(vc, animated: true)
    }

    @objc private func sliderValueChanged(_ slider: UISlider) {
        multiplier = Double(slider.value)
    }
}


