//
//  HelloWorldViewCcontroller.swift
//  abc
//
//  Created by zoo on 3/2/26.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit


class HelloWorldViewController: UIViewController  {
    var disposeBag = DisposeBag();
    let helloWorldLabel = UILabel();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true;
        setupUI();
    }
    
    private func setupUI() {
        view.backgroundColor = .white;
        helloWorldLabel.textColor = .black;
        helloWorldLabel.font = .systemFont(ofSize: 24);
        helloWorldLabel.text = "Hello, World!";
        let stack = UIStackView(
            arrangedSubviews:  [helloWorldLabel]
        )
        
        stack.axis = .horizontal;
        stack.alignment = .center;
        stack.translatesAutoresizingMaskIntoConstraints = false;
        
        view.addSubview(stack)
        NSLayoutConstraint.activate([stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                                    ])

    }
    
}
