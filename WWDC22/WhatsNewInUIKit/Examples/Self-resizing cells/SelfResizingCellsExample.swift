//
//  SelfResizingCellsExample.swift
//  WhatsNewInUIKit
//
//  Created by Ferhan Akkan on 9.06.2022.
//

import UIKit

final class  SelfResizingCellsExample: UIViewController {

    private lazy var collectionView: UICollectionView = { [weak self] in
        var config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(
            SelfResizingCollectionViewCell.self,
            forCellWithReuseIdentifier: SelfResizingCollectionViewCell.description()
        )

        //Enable by default
        collectionView.selfSizingInvalidation = .enabledIncludingConstraints
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
    }

    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        collectionView.reloadData()
    }
}

extension SelfResizingCellsExample: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: SelfResizingCollectionViewCell.description(), for: indexPath)
    }
}
