//
//  AppCoordinator.swift
//  abc
//
//  Created by 윤영주 on 2/15/26.
//

import Foundation
import UIKit
import RxSwift
import RxRelay
import RxCocoa

class AppCoordinator: ReactiveCoordinator<Void> {
    
    override func start() -> Observable<Void> {
        let viewModel = CounterViewModel()
        var viewController = CounterViewController()
        viewController.bind(viewModel: viewModel)
        
        navigationController.viewControllers = [viewController]
        return Observable.never()
    }
    
}
