import UIKit

var greeting = "Hello, playground"

let list = Array<String>()

func nomeFunc(_ naoNomeado:String, nomeado:String) -> String {
    return "sasda"
}

class Refeicao {
    
    
    //Atributos
    var name: String
    var felicidade: String
    var itens : Array<Item> = []
    
    init(name: String, felicidade:String) {
        self.name=name
        self.felicidade=felicidade
    }
    
    func totalCalorias() -> Double {
        var totalCalorias = 0.0
        for item in self.itens {
            totalCalorias+=item.calorias;
        }
        return totalCalorias
    }
}

class Item {
    var nome: String
    var calorias : Double
    init(nome:String , calorias :Double) {
        self.nome = nome
        self.calorias = calorias
    }
}


//let refeicao = Refeicao(name: "macarrão", felicidade: "5")
//
//let arroz = Item(nome: "Arroz", calorias: 51.1)
//let carne = Item(nome: "File", calorias: 71)
//let feijao = Item(nome: "Feijão", calorias: 36)
//
//refeicao.itens.append(arroz)
//refeicao.itens.append(carne)
//refeicao.itens.append(feijao)
//
//print(refeicao.name)
//
//if let primeiro = refeicao.itens.first {
//    print(primeiro.nome)
//}
//
//print("Total calorias: \(refeicao.totalCalorias())")
