//
//  AvaliadorTests.swift
//  estudoDeTDDTests
//
//  Created by Beatriz Teles Castro on 22/09/19.
//  Copyright © 2019 Beatriz Teles Castro. All rights reserved.
//

import XCTest
@testable import estudoDeTDD

class AvaliadorTests: XCTestCase {

    
    private var joao: Usuario!
    private var jose: Usuario!
    private var maria: Usuario!
    
    private var leiloeiro: Avaliador!
    
    override func setUp() {
        joao = Usuario(nome: "Joao")
        jose = Usuario(nome: "Jose")
        maria = Usuario(nome: "Maria")
        
        leiloeiro = Avaliador()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   
    func testDeveEntenderLancesEmOrdemCrescente() {
        
        // Cenario

        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        
        
        // Validacao
        try? leiloeiro.avalia(leilao: leilao)
        
        
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400.0, leiloeiro.maiorLance())
    }
    
    func testDeveEntenderLancesEmOrdemCrescenteComOutrosValores() {
        
       
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 1000.0))
        leilao.propoe(lance: Lance(joao, 2000.0))
        leilao.propoe(lance: Lance(jose, 3000.0))
        
        
        // Validacao

        try? leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(3000.0, leiloeiro.maiorLance())
    }

    func testDeveEntenderLeilaoComUmLance(){
       
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(joao, 300.0))
        
       try? leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(300.0, leiloeiro.menorLance())
        XCTAssertEqual(300.0, leiloeiro.maiorLance())
        
    }
    
    func testDeveEncoontrarOsTresMaioresLances() {
       
        
        
        let leilao = CriadorDeLeilao().para(descricao: "Playstation 4")
            .lance(usuario: joao, valor: 300.0)
            .lance(usuario: maria, valor: 400.0)
            .lance(usuario: joao, valor: 500.0)
            .lance(usuario: maria, valor: 600.0).constroi()
            

        

        try? leiloeiro.avalia(leilao: leilao)
        
        let listaLances = leiloeiro.tresMaiores()
        
        XCTAssertEqual(3, listaLances.count)
        XCTAssertEqual(600, listaLances[0].valor)
        XCTAssertEqual(500, listaLances[1].valor)
        XCTAssertEqual(400, listaLances[2].valor)
    }
    
    func testDeveIgnorarLeilaoSemNenhumLance() {
        
        let leilao = CriadorDeLeilao().para(descricao: "Playstation 4").constroi()
        
        XCTAssertThrowsError(try leiloeiro.avalia(leilao: leilao), "Not Possible", {
            (error) in
            print(error.localizedDescription)
        })
    }
    
    
}
