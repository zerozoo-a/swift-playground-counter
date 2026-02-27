//
//  StringViewModel.swift
//  abc
//
//  Created by 윤영주 on 2/16/26.
//

import Foundation
import RxSwift
import RxRelay


class StringViewModel: InputOutputAttachable {
    
    struct Input { }
    
    struct Output {
        let string: BehaviorRelay<String>
    }
    
    let disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        let string = BehaviorRelay<String>(value: "Hello, Mustit system?")
        
        return Output(string: string)
    }
    
}

