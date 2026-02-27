//
//  PatternCoordinator.swift
//  abc
//
//  Created by 윤영주 on 2/17/26.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    
    var navigationController: UINavigationController { get set }
    
    func start()
}
