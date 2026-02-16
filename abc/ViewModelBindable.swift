//
//  ViewModelBindable.swift
//  abc
//
//  Created by 윤영주 on 2/15/26.
//

import UIKit
import Foundation
import RxSwift

protocol ViewModelBindable: AnyObject {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    var disposeBag: DisposeBag { get set }
    
    func bindViewModel()
}

extension ViewModelBindable where Self: UIViewController {
    func bind(viewModel: ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        bindViewModel()
    }
}

