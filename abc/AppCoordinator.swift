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
import SwiftUI

class AppCoordinator: ReactiveCoordinator<Void> {
    
    override func start() -> Observable<Void> {
        let swiftUIVC = UIHostingController(rootView: RootAppTabView())
        navigationController.viewControllers = [swiftUIVC]

//        viewModel.goString
//            .subscribe(onNext: { [weak self] in
//                guard let self = self else { return }
//                let stringCoordinator = StringCoordinator(navigationController: self.navigationController)
//                stringCoordinator.start()
//                    .subscribe()
//                    .disposed(by: self.disposeBag)
//            })
//            .disposed(by: disposeBag)
//        
//        viewModel.goHelloWorld.subscribe(onNext: { [weak self] in guard let self = self else { return }
//            let helloWorldCoordinator = HelloWorldCoordinator(navigationController: self.navigationController)
//            helloWorldCoordinator.start()
//                .subscribe()
//                .disposed(by: self.disposeBag)
//        }).disposed(by: self.disposeBag)

        return Observable.never()
    }
    
}
