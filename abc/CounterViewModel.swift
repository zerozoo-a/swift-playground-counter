//
//  CounterViewModel.swift
//  abc
//
//  Created by 윤영주 on 2/15/26.
//

import Foundation
import RxSwift
import RxRelay

class CounterViewModel: InputOutputAttachable {
    let goString = PublishRelay<Void>()
    
    struct Input {
        let plusTap: PublishRelay<Void>
        let minusTap: PublishRelay<Void>
        let goStringTap: PublishRelay<Void>
    }
    
    struct Output {
        let count: BehaviorRelay<Int>
        let goString: PublishRelay<Void>
    }
    
    let disposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        let count = BehaviorRelay<Int>(value: 0)
        
        input.plusTap
            .subscribe(onNext: { count.accept(count.value + 1) })
            .disposed(by: disposeBag)
        
        input.minusTap
            .subscribe(onNext: { count.accept(count.value - 1) })
            .disposed(by: disposeBag)
        
        input.goStringTap.bind(to: goString)
            .disposed(by: disposeBag)
        
        
        return Output(count: count, goString: goString)
        
    }
}
