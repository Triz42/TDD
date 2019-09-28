//
//  EncerradorDeLeilaoTest.swift
//  estudoDeTDDTests
//
//  Created by Beatriz Teles Castro on 28/09/19.
//  Copyright © 2019 Beatriz Teles Castro. All rights reserved.
//

import XCTest
@testable import estudoDeTDD

class EncerradorDeLeilaoTest: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        
    }
    func testEncerraLeilaoDeSemanaAntes() {
        let formatador = DateFormatter()
        formatador.dateFormat = "yyyy/MM/dd"
        
        guard let dataAntiga = formatador.date(from: "2018/05/09") else { return }
        
        let tvLed = CriadorDeLeilao().para(descricao: "Tv Led").naData(data: dataAntiga).constroi()
        let geladeira = CriadorDeLeilao().para(descricao: "Geladeira").naData(data: dataAntiga).constroi()
        
        let dao = LeilaoDaoFalso()
        
        dao.salva(leilao: tvLed)
        dao.salva(leilao: geladeira )
        
        let encerradorDeLeilao = EncerradorDeLeilao()
        
        encerradorDeLeilao.encerra()
        
        let leilaoEncerrados = dao.encerrados()

        
        XCTAssertEqual(2, leilaoEncerrados.count)
        
        XCTAssertTrue(leilaoEncerrados[0].isEncerrado()!)
        XCTAssertTrue(leilaoEncerrados[1].isEncerrado()!)
    }

}
 
