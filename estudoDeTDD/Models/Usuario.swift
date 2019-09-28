//
//  Usuario.swift
//  estudoDeTDD
//
//  Created by Beatriz Teles Castro on 22/09/19.
//  Copyright © 2019 Beatriz Teles Castro. All rights reserved.
//

import Foundation
class Usuario {
    
    let id:Int?
    let nome:String
    
    init(id:Int? = nil, nome:String) {
        self.id = id
        self.nome = nome
        
    }
}

extension Usuario : Equatable {
    static func == (lhs: Usuario, rhs: Usuario) -> Bool {
        if lhs.nome != rhs.nome {
            return false
        }
        return true
    }
    
    
}
