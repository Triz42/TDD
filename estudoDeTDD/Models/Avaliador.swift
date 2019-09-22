//
//  Avaliador.swift
//  estudoDeTDD
//
//  Created by Beatriz Teles Castro on 22/09/19.
//  Copyright © 2019 Beatriz Teles Castro. All rights reserved.
//

import Foundation
enum ErrorAvaliador: Error {
    case LeilaoSemLance(String)
}
class Avaliador {
    
    //Definindo valores que recebem o menor e maior valor possivel
    private var maiorDeTodos = Double.leastNonzeroMagnitude
    private var menorDeTodos = Double.greatestFiniteMagnitude
    private var maiores : [Lance] = []
    
    
    
    //Avalia qual foi o menor e maior lance de um leilao
    func avalia(leilao:Leilao) throws {
        
        if leilao.lances?.count == 0 {
            throw ErrorAvaliador.LeilaoSemLance("Não é possivel avaliar leilao sem lances")
        }
        guard let lances = leilao.lances else { return }
        
        for lance in lances {
            if lance.valor > maiorDeTodos {
                maiorDeTodos = lance.valor
            }
            if lance.valor < menorDeTodos {
                menorDeTodos = lance.valor
            }
        }
        
        pegaMaioresLances(leilao: leilao)
    }
    
    func maiorLance() -> Double {
        return maiorDeTodos
    }
    
    func menorLance() -> Double {
        return menorDeTodos
    }
    
    func pegaMaioresLances(leilao: Leilao) {
        guard let lances = leilao.lances else {return}
        
        maiores = lances.sorted(by: { (lista1, lista2) -> Bool in
            return lista1.valor > lista2.valor
        })
        
        let maioresLances = maiores.prefix(3)
        
        maiores = Array(maioresLances)
    }
    
    func tresMaiores () -> [Lance] {
        return maiores
    }
}
