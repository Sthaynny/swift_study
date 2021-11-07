//
//  RefeicaoDAO.swift
//  swift_study
//
//  Created by Igor Sthaynny on 07/11/21.
//

import Foundation


class RefeicaoDAO{
    
    
    static func save(_ refeicoes : [Refeicao]){
        guard let caminho = getPath() else {return}
        
        do{
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch{
            print(error.localizedDescription)
        }
    }
    
    static func load() -> [Refeicao] {
        guard let caminho = getPath() else {return []}
        
        do{
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else{
                return []
            }
            return refeicoesSalvas
        } catch{
            print(error.localizedDescription)
            return []
        }
        
    }
    
    private static func getPath() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else{ return nil }
        let caminho = diretorio.appendingPathComponent("refeicao")
        return caminho
    }
    
    
    
}
