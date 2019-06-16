//
//  MenuHeaderCell.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 15/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import UIKit

class MenuHeaderCell: UIView {
    
    //MARK: - Properties
    
    var stackView: UIStackView!
    var labelName: UILabel!
    var labelAge: UILabel!
    
    //MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configure()
    }
    
    //MARK: - Handlers
    
    func configure() {
        
        self.labelAge = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: self.frame.width, height: self.frame.height)))
        self.labelAge.font = UIFont(name: self.labelAge.font.fontName, size: 12)
        self.labelName = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: self.frame.width, height: self.frame.height)))
        
        
        
        self.stackView = UIStackView(frame: CGRect(x: 24, y: 8, width: self.frame.width, height: self.frame.height))
        self.addSubview(self.stackView)
        
        self.stackView.axis = .vertical
        self.stackView.alignment = .leading
        self.stackView.distribution = .fillEqually
        
        self.stackView.addArrangedSubview(self.labelName)
        self.stackView.addArrangedSubview(self.labelAge)
        
    }
    
    func bind(usuarioView: UserView) {
        
        self.labelName.text = usuarioView.name
        
        self.labelAge.attributedText = self.message(age: usuarioView.age)
    }
    
    func message(age: String) -> NSMutableAttributedString {
        
        let mensagem = NSMutableAttributedString()
        
        mensagem.append(NSAttributedString(string: "Idade: ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black]))
        
        mensagem.append(NSAttributedString(string: age, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 12)]))
        
        return mensagem
    }
}
