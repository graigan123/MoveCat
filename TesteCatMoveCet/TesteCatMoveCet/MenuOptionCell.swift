//
//  MenuOptionCell.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 15/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import UIKit

class MenuOptionCell: UITableViewCell {
    
    //MARK: - Properties
    
    var label: UILabel = {
        
        let label = UILabel()
        
        return label
    }()
    
    var iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Handlers
    
    func configure() {
        
        self.backgroundColor = .white
        
        
        self.addSubview(iconImageView)
        self.iconImageView.translatesAutoresizingMaskIntoConstraints = false
        self.iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        self.iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12.0).isActive = true
        self.iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        self.iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        
        self.addSubview(self.label)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        self.label.leftAnchor.constraint(equalTo: self.iconImageView.rightAnchor, constant: 12.0).isActive = true
        
        
    }
    
    func bind(titulo: String, image: UIImage) {
        
        self.label.text = titulo
        self.label.textColor = .blue
        self.label.attributedText = self.mensagem(titulo)
        let imageBlue = image.withRenderingMode(.alwaysTemplate)
        self.iconImageView.image = imageBlue
        self.iconImageView.tintColor = UIColor.blue
        self.iconImageView.backgroundColor = .clear
    }
    
    func mensagem(_ titulo: String) -> NSMutableAttributedString {
        
        let mensagem = NSMutableAttributedString()
        
        mensagem.append(NSAttributedString(string: titulo, attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue, NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)]))
        
        return mensagem
    }
    
}
