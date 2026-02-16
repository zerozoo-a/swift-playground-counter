//
//  CounterViewController.swift
//  abc
//
//  Created by 윤영주 on 2/15/26.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class CounterViewController: UIViewController, ViewModelBindable {
    var viewModel: CounterViewModel!
    var disposeBag = DisposeBag()
    
    let countLabel = UILabel()
    let plusButton = UIButton(type: .system)
    let minusButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func bindViewModel() {
        let input = CounterViewModel.Input(
            plusTap: PublishRelay<Void>(),
            minusTap: PublishRelay<Void>()
        )
        
        plusButton.rx.tap
            .bind(to: input.plusTap)
            .disposed(by: disposeBag)
        
        minusButton.rx.tap
            .bind(to: input.minusTap)
            .disposed(by: disposeBag)
        
        let output = viewModel.transform(input: input)
        output.count.map { "\($0)" }
            .bind(to: countLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        countLabel.font = .systemFont(ofSize: 60)
        countLabel.textAlignment = .center
        countLabel.text = "0"
        
        plusButton.setTitle("+", for: .normal)
        plusButton.titleLabel?.font = .systemFont(ofSize: 40)
        
        minusButton.setTitle("-", for: .normal)
        minusButton.titleLabel?.font = .systemFont(ofSize: 40)
        
        let stack = UIStackView(arrangedSubviews: [minusButton, countLabel, plusButton])
        
        stack.axis = .horizontal
        stack.spacing = 40
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo:
view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo:
view.centerYAnchor)
        ])

    }
    
    
}
