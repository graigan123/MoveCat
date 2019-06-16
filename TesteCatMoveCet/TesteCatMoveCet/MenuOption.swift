//
//  MenuOption.swift
//  TesteCatMoveCet
//
//  Created by Diego Azevedo Vasconcelos on 15/06/19.
//  Copyright © 2019 Diego Azevedo Vasconcelos. All rights reserved.
//

import Foundation
import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case inicio
    case favorito
    case sair
    
    var description: String{
        
        switch self {
            
        case .inicio: return "Inicio"
        case .favorito: return "Favoritos"
        case .sair: return "Sair"
        }
    }
    
    var image: UIImage {
        
        switch self {
            
        case .inicio: return UIImage(named: "logo")!
        case .favorito: return UIImage(named: "ic_favoritado")!
        case .sair: return UIImage(named: "ic_sair")!
        }
    }
    
}
