//
//  HomeViewModel.swift
//  abc
//
//  Created by zoo on 3/10/26.
//

import Foundation
import RxSwift
import RxRelay

class HomeViewModel: InputOutputAttachable {
    struct Input {}
    struct Output {}
    let disposeBag = DisposeBag()
    func transform(input: Input) -> Output {
        return Output()
    }
}
