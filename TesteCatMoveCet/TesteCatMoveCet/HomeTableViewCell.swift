//
//  HomeTableViewCell.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 14/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var contantView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imageMovie: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "movieIcon")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var favoriteImage: UIImageView = {
        var img = UIImageView()
        img.image = UIImage(named: "ic_favoritar")
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var textTitleMovie: UILabel = {
        
        let label = UILabel()
        label.backgroundColor = UIColor.yellow
        label.text  = "Hi World"
        label.textAlignment = .center
        
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var stackViewHorizontal: UIStackView = {
        
        var stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.distribution = UIStackView.Distribution.equalSpacing
        stack.alignment = UIStackView.Alignment.center
        stack.spacing = 16.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.configure()
    }
    
    func configure() {
        
        self.addSubview(self.contantView)
        self.stackViewHorizontal.addArrangedSubview(self.imageMovie)
        self.stackViewHorizontal.addArrangedSubview(self.textTitleMovie)
        self.stackViewHorizontal.addArrangedSubview(self.favoriteImage)
        self.contantView.addSubview(self.stackViewHorizontal)
        self.setConstraints()
        
        self.backgroundColor = .black
        
    }
    
    func setConstraints() {
        
        self.contantView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        self.contantView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        self.contantView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        self.contantView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        
        self.stackViewHorizontal.topAnchor.constraint(equalTo: self.contantView.topAnchor).isActive = true
        self.stackViewHorizontal.trailingAnchor.constraint(equalTo: self.contantView.trailingAnchor).isActive = true
        self.stackViewHorizontal.leadingAnchor.constraint(equalTo: self.contantView.leadingAnchor).isActive = true
        self.stackViewHorizontal.bottomAnchor.constraint(equalTo: self.contantView.bottomAnchor).isActive = true
        
        self.imageMovie.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.imageMovie.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        self.favoriteImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.favoriteImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
//        self.textTitleMovie.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
//        self.textTitleMovie.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
    }
    
    func bind(title: String, image: String) {
        
        self.textTitleMovie.text = title
        self.imageMovie.imageFromURL(urlString: "https://image.tmdb.org/t/p/w500/" + image)
        
    }
}
