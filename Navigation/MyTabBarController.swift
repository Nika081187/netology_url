//
//  MyTabBarController.swift
//  Navigation
//
//  Created by v.milchakova on 11.01.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class MyTabBarController: UIViewController, UITabBarDelegate {

    let tabBar = UITabBar()
    
    private lazy var updateLabel: UILabel = {
        let label = UILabel()
        label.toAutoLayout()
        label.textColor = .darkGray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.delegate = self
        addTabbar()
        updateUI()
    }

    func addTabbar() -> Void {

        let item1 = UITabBarItem(title: "Feed", image: nil, tag: 1)
        let item2 = UITabBarItem(title: "Profile", image: nil, tag: 2)

        tabBar.items = [item1, item2]
        tabBar.selectedItem = item1

        self.view.addSubview(tabBar)
        tabBar.addSubview(updateLabel)
        tabBar.toAutoLayout()
        
        NSLayoutConstraint.activate([
            
            tabBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            tabBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            tabBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            updateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            updateLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        view.backgroundColor = .systemGray5
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.title {
        case "Feed":
            navigationController?.pushViewController(FeedViewController(), animated: true)
        case "Profile":
            navigationController?.pushViewController(ProfileViewController(), animated: true)
        default:
            fatalError("Unknown tab bar item!")
        }
    }

    private var time: Date?
      
    private lazy var dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .short
      formatter.timeStyle = .long
      return formatter
    }()
    
    func fetch(_ completion: () -> Void) {
      time = Date()
      completion()
    }
    
    func updateUI() {
      guard updateLabel != nil  else {
        return
      }
      
      if let time = time {
        updateLabel.text = dateFormatter.string(from: time)
      } else {
        updateLabel.text = "Not yet updated"
      }
    }
}
