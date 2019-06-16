//
//  ContainerController.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 15/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import UIKit

protocol HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?)
}

class ContainerController: UIViewController {
    
    //MARK: - Properties
    
    var homeVC: HomeViewController!
    var menuVC: MenuController!
    var centerCV: UIViewController!
    
    var isExpanded = false
    var viewPhanton: UIView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureHomeController()
        
        self.viewPhanton = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        self.viewPhanton.backgroundColor = .clear
        self.centerCV.view.addSubview(self.viewPhanton)
        self.viewPhanton.isHidden = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ContainerController.handleViewTap))
        self.viewPhanton.addGestureRecognizer(tap)
    }
    
    //MARK: - Handlers
    func configureHomeController() {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.homeVC = vc
        self.homeVC.delegate = self
        self.centerCV = UINavigationController(rootViewController: homeVC)
        view.addSubview(self.centerCV.view)
        addChild(self.centerCV)
        self.centerCV.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if self.menuVC == nil {
            self.menuVC = MenuController()
            self.menuVC.delegate = self
            self.view.insertSubview(self.menuVC.view, at: 0)
            addChild(self.menuVC)
            menuVC.didMove(toParent: self)
        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand {
            //show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveLinear, animations: {
                
                self.centerCV.view.frame.origin.x = self.centerCV.view.frame.width - 80
                self.viewPhanton.isHidden = false
            })
        } else {
            //hide menu
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }) { (_) in
                self.centerCV.view.frame.origin.x = 0
                //                self.centerController.view.removeFromSuperview()
                //                self.viewPhanton = nil
            }
        }
        //        self.animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        
        switch menuOption {
         
        case .inicio:
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            
            self.homeVC = vc
            
            self.homeVC.delegate = self
            
            self.centerCV = UINavigationController(rootViewController: homeVC)
            
            view.addSubview(self.centerCV.view)
            addChild(self.centerCV)
            self.centerCV.didMove(toParent: self)
            
        case .favorito:
            
            break
        case .sair:
            
            view.isUserInteractionEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                let window: UIWindow = UIApplication.shared.keyWindow!
                self.view.isUserInteractionEnabled = true
                UIView.transition(with: window, duration: 0.4, options: .transitionCrossDissolve, animations: {
                    
                    let login = UIStoryboard.init(name: "Main", bundle: nil)
                    let vc = login.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                    vc.view.layoutIfNeeded()
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                    window.rootViewController = UINavigationController(rootViewController: vc)
                    
                }, completion: nil)
            }
            
            break
            
        }
        
        self.centerCV.view.addSubview(self.viewPhanton)
        self.viewPhanton.isHidden = true
    }
    

}

extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        
        if !self.isExpanded {
            
            self.configureMenuController()
        }
        
        self.isExpanded = !isExpanded
        self.animatePanel(shouldExpand: self.isExpanded, menuOption: menuOption)
    }
    
    func animacaoFechar() {
        
        UIView.animate(withDuration: 0.5) {
            self.centerCV.view.frame.origin.x = 0
            self.viewPhanton.isHidden = true
        }
    }
    @objc func handleViewTap() {
        
        if !self.isExpanded {
            
            self.configureMenuController()
        }
        self.isExpanded = !isExpanded
        self.animacaoFechar()
    }
}
