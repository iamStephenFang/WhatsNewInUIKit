//
//  ExampleViewController.swift
//  WWDC23
//
//  Created by StephenFang on 2023/7/13.
//

import UIKit

class ExampleViewController: UIViewController {
    
    var types: [ExampleType] {
        ExampleType.allCases
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        tableView.delegate = self
        tableView.dataSource = self
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
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ExampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        types.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description(), for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = types[indexPath.row].rawValue
        cell.contentConfiguration = config

        return cell
    }
}

extension ExampleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch types[indexPath.row] {
        case .previewExample:
            navigationController?.show(PreviewExampleViewController(), sender: nil)
        case .liftCycleExample:
            navigationController?.show(LifeCycleExampleViewController(), sender: nil)
        case .animatedSymbolExample:
            navigationController?.show(AnimatedSymbolExampleViewController(), sender: nil)
        case .timerPageControlExample:
            navigationController?.show(TimerPageControlExampleViewController(), sender: nil)
        case .contentConfigurationExample:
            navigationController?.show(ContentConfigurationExampleViewController(), sender: nil)
        case .dynamicLineHeightExample:
            navigationController?.show(DynamicLineHeightExampleViewController(), sender: nil)
        case .localeImageExample:
            navigationController?.show(LocaleImageExampleViewController(), sender: nil)
        }
        navigationController?.viewControllers.last?.title = types[indexPath.row].rawValue
    }
}
