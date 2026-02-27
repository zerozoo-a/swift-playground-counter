//
//  DisplayStringController.swift
//  abc
//
//  Created by 윤영주 on 2/16/26.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class StringViewController: UIViewController, ViewModelBindable {
    func bindViewModel() {
        let input = StringViewModel.Input()
        
        let output = viewModel.transform(input: input)
        output.string.bind(to:stringLabel.rx.text).disposed(by:disposeBag)
        
    }
    
    
    var viewModel: StringViewModel!
    var disposeBag = DisposeBag()
    
    let stringLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        stringLabel.textColor = .black
        stringLabel.font = .systemFont(ofSize: 24)
        let stack = UIStackView(
            arrangedSubviews: [stringLabel]
        )
        stack.axis = .horizontal
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        NSLayoutConstraint.activate([stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                                    ])

    }
    
    
}
