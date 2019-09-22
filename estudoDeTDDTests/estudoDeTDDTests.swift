//
//  estudoDeTDDTests.swift
//  estudoDeTDDTests
//
//  Created by Beatriz Teles Castro on 22/09/19.
//  Copyright © 2019 Beatriz Teles Castro. All rights reserved.
//

import XCTest
@testable import estudoDeTDD

class estudoDeTDDTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testDeveReceberUmLance() {
        let leilao = Leilao(descricao: "MacBoook Pro")
        
        XCTAssertEqual(0, leilao.lances?.count)
        
        let steveJobs = Usuario(nome: "Steve")
        
        leilao.propoe(lance: Lance(steveJobs, 1000.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(1000.0, leilao.lances?.first?.valor)
    }
    
    func testDeveReeceberVariosLances(){
        let leilao = Leilao(descricao: "MacBoook Pro")
        
        let steveJobs = Usuario(nome: "Steve")
        
        leilao.propoe(lance: Lance(steveJobs, 2000.0))
        
        let BillGates = Usuario(nome: "Bill")
        
        leilao.propoe(lance: Lance(BillGates, 3000.0))
        
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
        XCTAssertEqual(3000.0, leilao.lances?.last?.valor)
    }
    
    func testDeveIgnorarDoisLancesSeguidosDoMesmoUsuario() {
        
        
        let leilao = Leilao(descricao: "MacBoook Pro")
        
        let steveJobs = Usuario(nome: "Steve")
        
        leilao.propoe(lance: Lance(steveJobs, 2000.0))
        leilao.propoe(lance: Lance(steveJobs, 2020.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
    }
    
}
