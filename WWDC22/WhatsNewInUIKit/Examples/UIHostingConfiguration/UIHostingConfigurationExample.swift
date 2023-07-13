//
//  ViewController.swift
//  WhatsNewInUIKit
//
//  Created by Ferhan Akkan on 9.06.2022.
//

import UIKit
import SwiftUI

class UIHostingConfigurationExample: UIViewController {

    private lazy var tableView: UITableView = { [weak self] in
        let tableView = UITableView()
        tableView.register(CustomUIKitCell.self, forCellReuseIdentifier: CustomUIKitCell.description())
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.allowsSelection = false
        tableView.dataSource = self
        return tableView
    }()

    private let contentDatas: [ContentData] = [
        .init(title: "SwiftUI", description: "It feels like magic", imageName: "sparkles"),
        .init(title: "UIKit", description: "Old but gold", imageName: "sparkles")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension UIHostingConfigurationExample: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentDatas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contentData = contentDatas[indexPath.row]
        let cell = indexPath.row == 0 ? createSwiftUICell(with: contentData) : createUIKitCell(with: contentData)
        return cell
    }
}

private extension UIHostingConfigurationExample {
    func createSwiftUICell(with contentData: ContentData) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.contentConfiguration = UIHostingConfiguration {
            CustomSwiftUICell(contentData: contentData)
        }
        return cell
    }

    func createUIKitCell(with contentData: ContentData) -> UITableViewCell {
        let cell = CustomUIKitCell()
        cell.configure(with: contentData)
        return cell
    }
}
