//
//  Avaliador.swift
//  estudoDeTDD
//
//  Created by Beatriz Teles Castro on 22/09/19.
//  Copyright © 2019 Beatriz Teles Castro. All rights reserved.
//

import Foundation

class Avaliador {
    
    //Definindo valores que recebem o menor e maior valor possivel
    private var maiorDeTodos = Double.leastNonzeroMagnitude
    private var menorDeTodos = Double.greatestFiniteMagnitude
    
    //Avalia qual foi o menor e maior lance de um leilao
    func avalia(leilao:Leilao) {
        guard let lances = leilao.lances else { return }
        
        for lance in lances {
            if lance.valor > maiorDeTodos {
                maiorDeTodos = lance.valor
            }
            else if lance.valor < menorDeTodos {
                menorDeTodos = lance.valor
            }
        }
    }
    
    func maiorLance() -> Double {
        return maiorDeTodos
    }
    
    func menorLance() -> Double {
        return menorDeTodos
    }
    
}
