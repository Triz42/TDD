//
//  CriadorDeLeilao.swift
//  estudoDeTDD
//
//  Created by Beatriz Teles Castro on 22/09/19.
//  Copyright © 2019 Beatriz Teles Castro. All rights reserved.
//

import Foundation

class CriadorDeLeilao: NSObject {
    
    private var leilao : Leilao!
    
    func para(descricao: String) -> Self {
        leilao = Leilao(descricao: descricao)
        
        return self
    }
    
    func naData(data:Date) -> Self {
           leilao.data = data
           
           return self
    }
    
    func lance(usuario: Usuario, valor: Double) -> Self {
        leilao.propoe(lance: Lance(usuario, valor))
        
        return self
    }
    
    func constroi() -> Leilao {
        return leilao
    }
}
