//
//  Refeicao.swift
//  swift_study
//
//  Created by Igor Sthaynny on 24/10/21.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
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
    
    func detalhes() -> String{
        var mensagem = "A sua felicidade ao consumir a refeicao é \(felicidade)!\n"
     
        for item in self.itens {
            mensagem += "\n \(item.nome) - calorias: \(item.calorias)"
            
        }
        
        mensagem += "\n\nTotal calorias: \(totalCalorias())"
        
        return mensagem
    }
    
    // MARK: - NSCoding
    
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(felicidade, forKey: "felicidade")
        coder.encode(itens, forKey: "itens")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        felicidade = coder.decodeInteger(forKey: "felicidade")
        itens = coder.decodeObject(forKey: "itens") as! Array<Item>
    }
    
    
}

