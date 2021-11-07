//
//  itemDAO.swift
//  swift_study
//
//  Created by Igor Sthaynny on 07/11/21.
//

import Foundation


class ItemDAO{
    
    
    static func save(_ itens: [Item]){
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false)
            guard let caminho = getPath() else {return}
            try dados.write(to: caminho)
        } catch{
            print(error.localizedDescription)
        }
    }
    static func load() -> [Item]{
        do{
            guard let caminho = getPath() else {return []}
            let dados = try Data(contentsOf: caminho)
            guard let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? [Item] else{
                return []
            }
            return itensSalvos
            
        } catch{
            print(error.localizedDescription)
            return []
        }
    }
    
    private static func getPath()-> URL?{
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else{ return nil }
        let caminho = diretorio.appendingPathComponent("itens")
        return caminho
        
    }
}
