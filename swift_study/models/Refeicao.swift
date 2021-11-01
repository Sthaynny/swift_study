//
//  Refeicao.swift
//  swift_study
//
//  Created by Igor Sthaynny on 24/10/21.
//

import UIKit

class Refeicao: NSObject {
    //Atributos
    let name: String
    let felicidade: Int
    var itens : Array<Item>
    
    init(name: String, felicidade:Int, itens: [Item] = []) {
        self.name=name
        self.felicidade=felicidade
        self.itens = itens
    }
    
    func totalCalorias() -> Double {
        var totalCalorias = 0.0
        for item in self.itens {
            totalCalorias+=item.calorias;
        }
        return totalCalorias
    }
    
    
}

