//
//  HomeViewController.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 14/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeCellIdentifier = "HomeTableViewCell"
    var delegate: HomeControllerDelegate?
    
    var movieView: [MovieUnitaryView] = []
    
    var tableView: UITableView = {
       
        var tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.tableView)
        self.setConstraints()
        
        self.automaticallyAdjustsScrollViewInsets = false
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: self.homeCellIdentifier)
        self.tableView.reloadData()
        self.setDelegates()
        self.configureNavigationBar()
        
        self.movieView = MovieListModelView.getAllMovieUnitary()
        
    }
    
    func configureNavigationBar() {
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.blue]
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.navigationController?.navigationBar.layer.borderWidth = 0.3
        
        self.navigationItem.title = "Home"
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image:  UIImage.init(named: "ic_menu")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    @objc func handleMenuToggle() {
        
        self.delegate?.handleMenuToggle(forMenuOption: nil)
    }

    func setConstraints() {
    
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func setDelegates() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.homeCellIdentifier, for: indexPath) as! HomeTableViewCell
        
        let movie = self.movieView[indexPath.row]
        
        cell.bind(title: movie.title, image: movie.poster_path)
        
        let img = !movie.favortie ? "ic_favoritar" : "ic_favoritado"
        
        cell.favoriteImage.image = UIImage(named: img)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        self.performSegue(withIdentifier: "push", sender: self)
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        if let target = segue.destination as? MovieViewController {
            target.movieView = self.movieView[selectedPath.row]
            target.imageView.imageFromURL(urlString: "https://image.tmdb.org/t/p/w500/" + self.movieView[selectedPath.row].poster_path)
            var text = ""
            text.append("Title: \(self.movieView[selectedPath.row].title)\n")
            text.append("Original Title: \(self.movieView[selectedPath.row].original_title)\n")
            text.append("Overview:\n \(self.movieView[selectedPath.row].overview)\n")
            
            target.descricaoTextView.text = text
        }
    }
}
