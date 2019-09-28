//
//  LeilaoDaoFalso.swift
//  estudoDeTDD
//
//  Created by Beatriz Teles Castro on 28/09/19.
//  Copyright © 2019 Beatriz Teles Castro. All rights reserved.
//

import Foundation

class LeilaoDaoFalso {
    
    var leiloes : [Leilao] = []
    
    func salva(leilao: Leilao){
        leiloes.append(leilao)
    }
    
    func encerrados() -> [Leilao] {
        return leiloes.filter({ $0.encerrado == true })
    }
    
    func correntes() -> [Leilao] {
        return leiloes.filter({$0.encerrado == false})
    }
    
    func atualiza(leilao: Leilao){}
}
