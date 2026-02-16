//
//  InputOutputAttachable.swift
//  abc
//
//  Created by 윤영주 on 2/15/26.
//

import RxSwift

protocol InputOutputAttachable: AnyObject {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}


