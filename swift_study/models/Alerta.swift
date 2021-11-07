//
//  Alerta.swift
//  swift_study
//
//  Created by Igor Sthaynny on 07/11/21.
//

import Foundation
import UIKit

class Alerta{
    
    let controller : UIViewController
    
    init (controller: UIViewController){
        self.controller = controller
    }
    func exibir(titulo: String = "Desculpa!!", mensagem: String = "Algo de errado aconteceu... Tente novamente"){
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let fechar = UIAlertAction(title: "fechar", style: .cancel, handler: nil)
        alerta.addAction(fechar)
        controller.present(alerta, animated: true, completion: nil)
    }
}
