//
//  MovieViewController.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 15/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    var movieView = MovieUnitaryView()
    
    var imageView : UIImageView = {
        let theImageView = UIImageView()
        theImageView.image = UIImage(named: "logo")
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.backgroundColor = .red
        return theImageView
    }()
    
    var descricaoTextView: UITextView = {
        let textView = UITextView()
        textView.textAlignment = NSTextAlignment.justified
        textView.textColor = UIColor.blue
        textView.backgroundColor = UIColor.lightGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    
    var favoriteImage: UIButton = {
        var img = UIButton()
        img.setImage(UIImage(named: "ic_favoritar"), for: .normal)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.imageView)
        self.view.addSubview(self.descricaoTextView)
        self.view.addSubview(self.favoriteImage)
        self.automaticallyAdjustsScrollViewInsets = false
        self.setContraints()
        
        self.favoriteImage.addTarget(self, action: #selector(self.favoriteAction), for: .touchUpInside)
    }

    func setContraints() {
        
        self.imageView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 128).isActive = true
        self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.favoriteImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        self.favoriteImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.favoriteImage.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 8).isActive = true
        self.favoriteImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.descricaoTextView.topAnchor.constraint(equalTo: self.favoriteImage.bottomAnchor, constant: 8).isActive = true
        self.descricaoTextView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8).isActive = true
        self.descricaoTextView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8).isActive = true
        self.descricaoTextView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8).isActive = true
    }
    
    @objc func favoriteAction() {
        
        let result = uiRealm.objects(MovieUnitary.self).filter("id == %@", self.movieView.id)

        if let obj = result.first {
            
            try! uiRealm.write {
                obj.favorite = !obj.favorite
            }
        
        }
    }
}
