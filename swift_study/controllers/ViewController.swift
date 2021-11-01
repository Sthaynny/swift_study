//
//  ViewController.swift
//  swift_study
//
//  Created by Igor Sthaynny on 18/10/21.
//
import LocalAuthentication
import UIKit

protocol AdicionaRefeicaoDelegate{
    func add(_ refeicao:Refeicao)
}

class ViewController: UIViewController {
    
    // MARK: - ATRIBUTOS
    var delegate: AdicionaRefeicaoDelegate?
    
    // MARK: - IBOutlets
    
    @IBOutlet var nomeTextFild: UITextField?
    @IBOutlet var felicidadeTextFild: UITextField?

    // MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        guard let nomeRefeicao = nomeTextFild?.text , let felicidadeString = felicidadeTextFild?.text , let felicidade = Int(felicidadeString) else {
            print("erro ao adicionar refeição")
            return
        }
        
        let refeicao = Refeicao(name: nomeRefeicao, felicidade: felicidade)
       
        print("Comi \(refeicao.name) fiquei com felicidade \(refeicao.felicidade)!")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
        
    }
    

}

