//
//  UIPageControlExample.swift
//  WhatsNewInUIKit
//
//  Created by Ferhan Akkan on 10.06.2022.
//

import UIKit

final class UIPageControlExample: UIViewController {

    let collectionViewData: [UIColor] = [
        .red,
        .green,
        .blue
    ]

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.backgroundColor = .orange
        pageControl.layer.cornerRadius = 8
        pageControl.layer.masksToBounds = true
        pageControl.currentPage = .zero
        pageControl.numberOfPages = collectionViewData.count
        pageControl.direction = .leftToRight
        pageControl.preferredIndicatorImage = UIImage(systemName: "star")
        pageControl.preferredCurrentPageIndicatorImage = UIImage(systemName: "star.fill")
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.masksToBounds = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.description())
        collectionView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        collectionView.isPagingEnabled = true
        return collectionView
    }()

    private lazy var verticalSetterButton: UIButton = {
        let button = UIButton(primaryAction: .init(title: "Set Top to Bottom" ,handler: { [weak self] _ in
            self?.pageControl.direction = .topToBottom
        }))
        return button
    }()

    private lazy var horizontalSetterButton: UIButton = {
        let button = UIButton(primaryAction: .init(title: "Set Left to Right" ,handler: { [weak self] _ in
            self?.pageControl.direction = .leftToRight
        }))
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.addArrangedSubview(collectionView)
        stackView.addArrangedSubview(pageControl)
        stackView.addArrangedSubview(verticalSetterButton)
        stackView.addArrangedSubview(horizontalSetterButton)
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            verticalSetterButton.heightAnchor.constraint(equalToConstant: 50),
            horizontalSetterButton.heightAnchor.constraint(equalToConstant: 50),
        ])

        self.collectionView.reloadData()
    }
}

extension UIPageControlExample: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        collectionView.frame.size
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if pageControl.currentPage == indexPath.row {
            pageControl.currentPage = collectionView.indexPath(for: collectionView.visibleCells.first!)!.row
        }
    }
}

extension UIPageControlExample: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionViewData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: UICollectionViewCell.description(),
            for: indexPath
        )
        cell.contentView.backgroundColor = collectionViewData[indexPath.row]
        return cell
    }
}

