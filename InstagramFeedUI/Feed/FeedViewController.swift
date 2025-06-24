//
//  FeedViewController.swift
//  InstagramFeedUI
//
//  Created by murad on 17.06.2025.
//

import UIKit
import SnapKit

final class FeedViewController: UIViewController {
    //MARK: - Private Properties
    private let tableView = UITableView()
    private var items: [FeedItemType] = FeedItemType.makeSampleData()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

//MARK: - Private methods
private extension FeedViewController {
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftbarButtonItems()
        navigationItem.rightBarButtonItems = makeRightbarButtonItems()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableView.separatorStyle = .none
    }
    
    func makeLeftbarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(
            title: nil,
            image: UIImage(systemName: "chevron.down"),
            target: self,
            action: nil,
            menu: makeDropDownMenu()
        )
        return [logoBarButtonItem, dropDownButtonItem]
    }
    
    func makeRightbarButtonItems() -> [UIBarButtonItem] {
        let addBarButtonItem = UIBarButtonItem(
            title: nil,
            image: .addTopIcon,
            target: self,
            action: #selector(didTapPlusButton)
        )
        let directBarButtonItem = UIBarButtonItem(
            title: nil,
            image: .directTopIcon,
            target: self,
            action: #selector(didTapDirectButton)
        )
        let favoritesBarButtonItem = UIBarButtonItem(
            title: nil,
            image: .favsTopIcon,
            target: self,
            action: #selector(favoritesTapDirectButton)
        )
        return [addBarButtonItem, directBarButtonItem, favoritesBarButtonItem]
    }
    
    @objc func didTapPlusButton() {
        print("didTapPlusButton")
    }
    
    @objc func didTapDirectButton() {
        print("didTapDirectButton")
    }
    
    @objc func favoritesTapDirectButton() {
        print("favoritesTapDirectButton")
    }
    
    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("Favorites")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension FeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self)) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell 
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self)) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
}
