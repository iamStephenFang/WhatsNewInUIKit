//
//  HomeController.swift
//  WhatsNewInUIKit
//
//  Created by Ferhan Akkan on 10.06.2022.
//

import UIKit

final class HomeController: UIViewController {

    var titles: [ExampleType] {
        ExampleType.allCases
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.description())
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }

    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension HomeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch titles[indexPath.row] {
        case .uiHostingConfigurationExample:
            navigationController?.show(UIHostingConfigurationExample(), sender: nil)
        case .selfSizingCellExample:
            navigationController?.show(SelfResizingCellsExample(), sender: nil)
        case .calendarView:
            navigationController?.show(UICalendarViewExample(), sender: nil)
        case .device:
            navigationController?.show(UIDeviceExample(), sender: nil)
        case .sfSymbols:
            navigationController?.show(SFSymbolsExample(), sender: nil)
        case .pageControl:
            navigationController?.show(UIPageControlExample(), sender: nil)
        case .uiSheetPresentation:
            navigationController?.show(UISheetPresentationControllerExample(), sender: nil)
        case .uiPasteControl:
            navigationController?.show(UIPasteControlViewControllerExample(), sender: nil)
        case .navigationStyle:
            navigationController?.show(NavigationStyleExample(), sender: nil)
        }
        navigationController?.viewControllers.last?.title = titles[indexPath.row].rawValue
    }
}

extension HomeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.description(), for: indexPath) as! HomeTableViewCell
        cell.configure(with: titles[indexPath.row].rawValue)
        return cell
    }
}
