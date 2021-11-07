//
//  RemoveRefeicaoViewController.swift
//  swift_study
//
//  Created by Igor Sthaynny on 07/11/21.
//

import Foundation
import UIKit


class RemoveRefeicaoViewController{
    let controller: UIViewController
    init(controller : UIViewController) {
        self.controller = controller
    }
    
    func exibi(refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
        
        let alerta = UIAlertController(title: refeicao.name, message: refeicao.detalhes(), preferredStyle: .alert)
        
        let fechar = UIAlertAction(title: "Fechar", style: .cancel)
        let botaoRemover = UIAlertAction(title: "Remover", style: .destructive,
        handler: handler)
        
        alerta.addAction(fechar)
        alerta.addAction(botaoRemover)
        controller.present(alerta, animated: true, completion: nil)
    }
}
