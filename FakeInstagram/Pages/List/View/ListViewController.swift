//
//  ListViewController.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/04.
//

import Component
import UIKit

final class ListViewController: UIViewController, Instantiatable {
    @IBOutlet private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<ListCollectionViewSection, AnyHashable>!
    var presenter: ListPresentation!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        title = "List"
    }
}

extension ListViewController {
    private func setupCollectionView() {
        collectionView.compositionalLayout(itemWidthDimension: .fractionalWidth(1.0),
                                           itemHeightDimension: .estimated(406))
        collectionView.register(ListCollectionViewCell.self)
    }

    func performSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<ListCollectionViewSection, AnyHashable>()
        snapshot.appendSections([.main])
        snapshot.appendItems([])
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<ListCollectionViewSection, AnyHashable>(collectionView: collectionView) { collectionView, indexPath, item -> UICollectionViewCell? in
            let cell: ListCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            return cell
        }
    }
}

extension ListViewController: ListView {}
