//
//  HomeViewController.swift
//  abc
//
//  Created by zoo on 3/10/26.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class HomeViewController: UIViewController, ViewModelBindable {
    var viewModel: HomeViewModel!
    var disposeBag: DisposeBag = DisposeBag()
    
    let titleLabel = UILabel()
    let button = UIButton(type: .system)
    
    func bindViewModel() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .white
        
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.text = "Home"
        button.setTitle("Go", for: .normal)
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, button])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
