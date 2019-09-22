//
//  Leilao.swift
//  estudoDeTDD
//
//  Created by Beatriz Teles Castro on 22/09/19.
//  Copyright © 2019 Beatriz Teles Castro. All rights reserved.
//

import Foundation


class Leilao {
    
    let descricao:String
    let imagem:String?
    var lances:[Lance]?
    
    init(descricao:String, imagem:String? = nil, lances:[Lance] = []) {
        self.descricao = descricao
        self.imagem = imagem
        self.lances = lances
    }
    
    func propoe(lance:Lance) {
        
        guard let listaDeLances = lances else { return }
        if listaDeLances.count == 0 || ultimoLance(lance: listaDeLances).usuario != lance.usuario {
            lances?.append(lance)
        }
        
    }
    
    func ultimoLance (lance: [Lance] ) -> Lance {
        return (lances?[lance.count-1])!
    }
    
    
}
