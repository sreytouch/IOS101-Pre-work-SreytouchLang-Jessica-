//
//  ViewController.swift
//  IOS101-Pre-work-SreytouchLang(Jessica)
//
//  Created by Sreytouch(Jessica) on 4/28/25.
//

import UIKit

class ViewController: UIViewController {

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sreytouch Lang"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        return label
    }()
    
    private let universityLabel: UILabel = {
        let label = UILabel()
        label.text = "Westcliff University"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Mobile Software Engineer"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    private let colorButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Change", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var buttonContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(colorButton)
        
        NSLayoutConstraint.activate([
            colorButton.topAnchor.constraint(equalTo: container.topAnchor, constant: 40),
            colorButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40),
            colorButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            colorButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
            colorButton.heightAnchor.constraint(equalToConstant: 50),
            colorButton.widthAnchor.constraint(equalToConstant: 100)   
        ])
        
        return container
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, universityLabel, titleLabel, buttonContainer])
        stack.axis = .vertical
        stack.spacing = 20
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }

    private func setupViews() {
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
        ])
        
        colorButton.addTarget(self, action: #selector(changeBackgroundColor), for: .touchUpInside)
    }

    @objc private func changeBackgroundColor() {
        let randomColor = changeColor()
        
        UIView.animate(withDuration: 0.3) {
            self.view.backgroundColor = randomColor
        }
    }

    private func changeColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        return UIColor(red: red, green: green, blue: blue, alpha: 0.5)
    }
}

