//
//  DynamicLineHeightExampleViewController.swift
//  WWDC23
//
//  Created by StephenFang on 2023/7/13.
//

import UIKit

struct ContentData {
    let title: String
    let description: String
}


final class DynamicLineHeightExampleViewController: UIViewController {
    
    private let contentDataItems: [ContentData] = [
        ContentData(title: "မြန်မာ", description: "Burmese" ),
        ContentData(title: "中文", description: "Chinese" ),
        ContentData(title: "English", description: "English" ),
        ContentData(title: "日本語", description: "Japanese" ),
        ContentData(title: "한국인", description: "Korean" ),
        ContentData(title: "แบบไทย", description: "Thai" )
    ]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension DynamicLineHeightExampleViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentDataItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description(), for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = contentDataItems[indexPath.item].title
        config.secondaryText = contentDataItems[indexPath.item].description
        cell.contentConfiguration = config
        
        return cell
    }
}

extension DynamicLineHeightExampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
