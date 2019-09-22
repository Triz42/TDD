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
        if listaDeLances.count == 0 || podeDarLance(usuario: lance.usuario, listaDeLances: listaDeLances) {
            lances?.append(lance)
        }
        
    }
    
    func ultimoLance (lance: [Lance] ) -> Lance {
        return (lances?[lance.count-1])!
    }
    
    func qtdLancesDeUsuario (usuario : Usuario ) -> Int {
        
        guard let listaLances = lances else { return 0}
               var total = 0
               
               for lanceAtual in listaLances {
                   if lanceAtual.usuario == usuario {
                       total += 1
                   }
               }
       return total
    }
    
    func podeDarLance(usuario: Usuario, listaDeLances: [Lance]) -> Bool {
     return ultimoLance(lance: listaDeLances).usuario != usuario && qtdLancesDeUsuario(usuario: usuario) < 5
    }
    
    
}
