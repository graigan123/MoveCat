//
//  SearchStatefulViewControllerDelegate.swift
//  SysZone
//
//  Created by tmp_user on 05/02/19.
//  Copyright © 2019 tmp_user. All rights reserved.
//

import Foundation

protocol SearchStatefulViewControllerDelegate: StatefulViewControllerDelegate/*, UISearchResultsUpdating*/ {
    
//    var searchController: UISearchController { get set }
    
    func placeholders() -> (empty: String, notFound: String)
    
    func updatePlaceholders()
}

extension SearchStatefulViewControllerDelegate {
    
    func updatePlaceholders() {
        
//        if let _ = searchController.searchResultsController {
//            return
//        }
        
//        if let text = searchController.searchBar.text, text.trim() != "" {
//            if let emptyView = self.emptyView as? EmptyView {
//                emptyView.emptyText.text = placeholders().notFound
//            }
//        } else {
//            if let emptyView = self.emptyView as? EmptyView {
//                emptyView.emptyText.text = placeholders().empty
//            }
//        }
    }
}
