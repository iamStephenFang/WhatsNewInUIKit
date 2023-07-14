//
//  TimerPageControllerExampleViewController.swift
//  WWDC23
//
//  Created by StephenFang on 2023/7/13.
//

import UIKit


final class TimerPageControlExampleViewController: UIViewController {
    
    let collectionViewData: [UIColor] = [
        .red,
        .green,
        .blue
    ]
    
    let timerProgress = UIPageControlTimerProgress(preferredDuration: 5)
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = collectionViewData.count
        pageControl.progress = timerProgress
        pageControl.addTarget(self, action: #selector(pageChanged), for: .valueChanged)
        return pageControl
    }()
    
    private lazy var tapTipLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Tap on the page control to start"
        return label
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.description())
        collectionView.isPagingEnabled = true
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pageControl.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(tapTipLabel)
        NSLayoutConstraint.activate([
            tapTipLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tapTipLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tapTipLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            tapTipLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        timerProgress.resetsToInitialPageAfterEnd = true
        timerProgress.resumeTimer()
    }
    
    @objc func pageChanged(_ sender: UIPageControl) {
        // It seems like a bug since iOS 14, see https://stackoverflow.com/questions/41884645/uicollectionview-scroll-to-item-not-working-with-horizontal-direction for details
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: IndexPath(item: sender.currentPage, section: 0), at: .centeredHorizontally, animated: true)
        collectionView.isPagingEnabled = true
    }
}

extension TimerPageControlExampleViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        view.frame.size
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

extension TimerPageControlExampleViewController: UICollectionViewDataSource {
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
