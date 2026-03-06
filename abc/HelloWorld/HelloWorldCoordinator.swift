//
//  HelloWorldCoordinator.swift
//  abc
//
//  Created by zoo on 3/2/26.
//

import Foundation
import UIKit
import RxSwift

class HelloWorldCoordinator: ReactiveCoordinator<Void> {
    override func start() -> Observable<Void> {
        
        let viewController = HelloWorldViewController();
        navigationController.pushViewController(viewController, animated: true)
        
        return Observable.never()
    }
}
