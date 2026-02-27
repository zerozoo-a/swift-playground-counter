//
//  StringCoordinator.swift
//  abc
//
//  Created by 윤영주 on 2/17/26.
//

import Foundation
import UIKit
import RxSwift

class StringCoordinator: ReactiveCoordinator<Void> {
    override func start() -> Observable<Void> {
        let viewModel = StringViewModel()
        let viewController = StringViewController()
        viewController.bind(viewModel: viewModel)
        
        navigationController.pushViewController(viewController, animated: true)
        
        return Observable.never()
    }
}
