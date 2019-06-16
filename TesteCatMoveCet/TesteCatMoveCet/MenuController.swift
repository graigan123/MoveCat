//
//  MenuController.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 15/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import UIKit
import Reusable

private let reuseIdentifer = "MenuOptionCell"

class MenuController: UIViewController {
    
    //MARK: - Properties
    var tableView: UITableView!
    var titulos: [String]!
    var delegate: HomeControllerDelegate?
    var menuHeader: MenuHeaderCell!
    var usuarioView: UserView!
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titulosArray()
        self.configureTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateHeader), name: NSNotification.Name(rawValue: "updateHeader"), object: nil)
    }
    
    //MARK: - Handlers
    func titulosArray() {
        self.titulos = [String]()
        self.titulos = ["Home", "Favotite", "Logout"]
    }
    
    func configureTableView() {
        self.tableView = UITableView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(MenuOptionCell.self, forCellReuseIdentifier: reuseIdentifer)
        self.view.addSubview(self.tableView)
        self.tableView.backgroundColor = .white
        self.tableView.separatorStyle = .none
        self.tableView.rowHeight = 40
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        self.menuHeader = MenuHeaderCell(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        self.usuarioView = userCurrent
        self.menuHeader.bind(usuarioView: usuarioView)
        self.tableView.tableHeaderView = self.menuHeader
        self.tableView.tableHeaderView?.frame.size.height = 80
    }
    
    @objc func updateHeader() {
        self.usuarioView = userCurrent
        self.menuHeader.bind(usuarioView: usuarioView)
    }
}

extension MenuController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titulos.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer, for: indexPath) as! MenuOptionCell
        let menuOption = MenuOption(rawValue: indexPath.row)
        cell.bind(titulo: menuOption?.description ?? "vazio", image: menuOption?.image ?? UIImage(named: "ic_lupa")!)
        //        cell.bind(titulo: self.titulos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == self.titulos.count - 1 {
//            self.logoutService.getLogout()
        }
        //        if indexPath.row == 5 || indexPath.row == 6 /*|| indexPath.row == 7*/ {
        //            tableView.deselectRow(at: indexPath, animated: true)
        //            return
        //        }
        let menuOption = MenuOption(rawValue: indexPath.row)
        self.delegate?.handleMenuToggle(forMenuOption: menuOption)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
