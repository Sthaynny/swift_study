//
//  Item.swift
//  swift_study
//
//  Created by Igor Sthaynny on 24/10/21.
//

import UIKit

class Item: NSObject, NSCoding{
    
    let nome: String
    let calorias : Double
    init(nome:String , calorias :Double) {
        self.nome = nome
        self.calorias = calorias
    }
    
    
    // MARK: - NSCoding
    
    
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(calorias, forKey: "calorias")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        calorias = coder.decodeDouble(forKey: "calorias")
    }
}
