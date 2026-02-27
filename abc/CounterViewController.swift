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
    let goStringButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    /** 이벤트 콜백 함수와 view element의 바인딩 */
    func bindViewModel() {
        let input = CounterViewModel.Input(
            plusTap: PublishRelay<Void>(),
            minusTap: PublishRelay<Void>(),
            goStringTap: PublishRelay<Void>()
        )
        
        plusButton.rx.tap
            .bind(to: input.plusTap)
            .disposed(by: disposeBag)
        
        minusButton.rx.tap
            .bind(to: input.minusTap)
            .disposed(by: disposeBag)
        
        goStringButton.rx.tap.bind(to: input.goStringTap)
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
        countLabel.textColor = .black
        
        plusButton.setTitle("+", for: .normal)
        plusButton.titleLabel?.font = .systemFont(ofSize: 40)
        
        minusButton.setTitle("-", for: .normal)
        minusButton.titleLabel?.font = .systemFont(ofSize: 40)
        
        goStringButton.setTitle("Go String", for: .normal)
        
        
        let counterStack = UIStackView(arrangedSubviews: [minusButton, countLabel, plusButton])
        counterStack.axis = .horizontal
        counterStack.spacing = 40
        counterStack.alignment = .center

        let stack = UIStackView(arrangedSubviews: [counterStack, goStringButton])
        stack.axis = .vertical
        stack.spacing = 30
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }
    
    
}
