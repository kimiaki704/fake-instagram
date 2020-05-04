//
//  ListViewController.swift
//  FakeInstagram
//
//  Created by 鈴木 公章 on 2020/05/04.
//

import Component
import Model
import UIKit

final class ListViewController: UIViewController, Instantiatable {
    @IBOutlet private var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<ListCollectionViewSection, Post>!
    var presenter: ListPresentation!
    var posts: [Post] = [] {
        didSet {
            performSnapshot()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
        configureDataSource()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        title = "List"
    }
}

extension ListViewController {
    private func setupCollectionView() {
        collectionView.compositionalLayout(itemWidthDimension: .fractionalWidth(1.0),
                                           itemHeightDimension: .estimated(480))
        collectionView.register(ListCollectionViewCell.self)
    }

    func performSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<ListCollectionViewSection, Post>()
        snapshot.appendSections([.main])
        snapshot.appendItems(posts)
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<ListCollectionViewSection, Post>(collectionView: collectionView) { collectionView, indexPath, item -> UICollectionViewCell? in
            let cell: ListCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
            cell.setup(item)
            return cell
        }
    }
}

extension ListViewController: ListView {
    func showList(_ posts: [Post]) {
        self.posts = posts
    }

    func showNoContent() {
        print("💩 no content \n")
    }
}
