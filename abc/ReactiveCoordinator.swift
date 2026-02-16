//
//  ReactiveCoordinator.swift
//  abc
//
//  Created by 윤영주 on 2/15/26.
//

import Foundation
import UIKit
import RxSwift

class ReactiveCoordinator<ResultType>: NSObject {
    let disposeBag = DisposeBag()
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() -> Observable<ResultType> {
        fatalError("start() must be overridden")
    }
}
