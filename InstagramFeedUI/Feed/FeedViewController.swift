//
//  FeedViewController.swift
//  InstagramFeedUI
//
//  Created by murad on 17.06.2025.
//

import UIKit
import SnapKit

final class FeedViewController: UIViewController {
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
