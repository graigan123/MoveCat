//
//  RegisterViewController.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 14/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    var nameTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var ageTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.keyboardType = UIKeyboardType.numberPad
        return text
    }()
    
    var userNameTextField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var password: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.nameTextField)
        self.view.addSubview(self.ageTextField)
        self.view.addSubview(self.userNameTextField)
        self.view.addSubview(self.password)
        self.view.addSubview(self.registerButton)
        
        self.nameTextField.setTextField(placeholder: "Your name")
        self.ageTextField.setTextField(placeholder: "Your age")
        self.userNameTextField.setTextField(placeholder: "Your user anme")
        self.password.setTextField(placeholder: "Your password")
        self.registerButton.setButtonText(text: "Register")
        self.setConstraints()
        
        self.registerButton.addTarget(self, action: #selector(RegisterViewController.registerAction(_:)), for: .touchUpInside)
        
        self.view.backgroundColor = .black
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.backgroundColor = .black
        self.title = "Register"
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    @objc func registerAction(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func setConstraints() {
        
        self.nameTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 24).isActive = true
        self.nameTextField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 128).isActive = true
        self.nameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.ageTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 24).isActive = true
        self.ageTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 24).isActive = true
        self.ageTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.userNameTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 24).isActive = true
        self.userNameTextField.topAnchor.constraint(equalTo: self.ageTextField.bottomAnchor, constant: 24).isActive = true
        self.userNameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.password.widthAnchor.constraint(equalToConstant: self.view.frame.width - 24).isActive = true
        self.password.topAnchor.constraint(equalTo: self.userNameTextField.bottomAnchor, constant: 24).isActive = true
        self.password.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.registerButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 128).isActive = true
        self.registerButton.topAnchor.constraint(equalTo: self.password.bottomAnchor, constant: 48).isActive = true
        self.registerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}
