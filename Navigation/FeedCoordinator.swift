//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by v.milchakova on 11.02.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class FeedCoordinator {
    let navigator: UINavigationController
    
    init() {
        navigator = UINavigationController(rootViewController: FeedViewController())
    }
}
