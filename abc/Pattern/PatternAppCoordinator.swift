//
//  AppCoordinator.swift
//  abc
//
//  Created by 윤영주 on 2/17/26.
//

import Foundation
import UIKit

class PatternAppCoordinator: Coordinator {
    var childCoordinator: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showLogin()
    }
    
    private func showLogin() {
        let coordinator = LoginCoordinator(navigationController)
        coordinator.parentCoordinator = self
        childCoordinator.append(coordinator)
        coordinator.start()
    }
    
    func showHome() {
        let coordinator = HomeCoordinator(navigationController)
        childCoordinator.append(coordinator)
        coordinator.start()
    }
    
    
    
}
