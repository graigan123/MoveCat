//
//  LoginViewController.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 13/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import UIKit

enum LINE_POSITION {
    case LINE_POSITION_TOP
    case LINE_POSITION_BOTTOM
}

class LoginViewController: UIViewController {

    //MARK: - outlets
    var imageView : UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "yourImage.png")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.backgroundColor = .red
        return theImageView
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
    
    var accessButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - construtors
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.imageView)
        self.view.addSubview(self.userNameTextField)
        self.view.addSubview(self.password)
        self.view.addSubview(self.accessButton)
        self.view.addSubview(registerButton)
        
        self.userNameTextField.setTextField(placeholder: "Login")
        self.password.setTextField(placeholder: "Password")
        self.accessButton.setButtonText(text: "Access")
        self.registerButton.setButtonText(text: "Register")
        self.setConstraints()
        
        self.view.backgroundColor = .black
        
        self.accessButton.addTarget(self, action: #selector(LoginViewController.accessAction(_:)), for: .touchUpInside)
        self.registerButton.addTarget(self, action: #selector(LoginViewController.registerVCAction(_:)), for: .touchUpInside)
        
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func accessAction(_ sender: UIButton) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        self.present(resultViewController, animated: true, completion:nil)
        
    }
    
    @objc func registerVCAction(_ sender: UIButton) {
        
        performSegue(withIdentifier: "register", sender: nil)
    }
    
    func setConstraints() {
        
        self.imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 24).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.imageView.setCicle(height: 128.0)
        
        self.userNameTextField.widthAnchor.constraint(equalToConstant: self.view.frame.width - 24).isActive = true
        self.userNameTextField.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 24).isActive = true
        self.userNameTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        self.password.widthAnchor.constraint(equalToConstant: self.view.frame.width - 24).isActive = true
        self.password.topAnchor.constraint(equalTo: self.userNameTextField.bottomAnchor, constant: 24).isActive = true
        self.password.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.accessButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 128).isActive = true
        self.accessButton.topAnchor.constraint(equalTo: self.password.bottomAnchor, constant: 48).isActive = true
        self.accessButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.registerButton.widthAnchor.constraint(equalToConstant: self.view.frame.width - 128).isActive = true
        self.registerButton.topAnchor.constraint(equalTo: self.accessButton.bottomAnchor, constant: 48).isActive = true
        self.registerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
    //MARK: - Handlers
    func setDelegates() {
//        self.loginTextField.delegate = self
//        self.passtTextField.delegate = self
        
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    
}

extension LoginViewController {

    //MARK: - Memorizando os dados de login e senha ao entrar no app com sucesso.
    
    func memorizarDados() {
        
//        UserDefaults.standard.setValue(self.loginTextField.text!, forKey: Contants.shared.login)
//        UserDefaults.standard.setValue(self.passtTextField.text!, forKey: Contants.shared.pass)
        
    }
}
