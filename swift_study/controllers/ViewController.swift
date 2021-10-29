//
//  ViewController.swift
//  swift_study
//
//  Created by Igor Sthaynny on 18/10/21.
//
import LocalAuthentication
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextFild: UITextField?
    @IBOutlet var felicidadeTextFild: UITextField?

  
    @IBAction func adicionar(_ sender: Any) {
//        if let nomeRefeicao = nomeTextFild?.text, let felicidadeRefeicao = felicidadeTextFild?.text {
//            if let felicidade = Int(felicidadeRefeicao){
//                let refecao = Refeicao(name: nomeRefeicao, felicidade: felicidade)
//
//                print("Comi \(refecao.name) fiquei com felicidade \(refecao.felicidade)!")
//            }else{
//                print("Erro ao criar a refeição")
//            }
//
//        }
        
        guard let nomeRefeicao = nomeTextFild?.text , let felicidadeString = felicidadeTextFild?.text , let felicidade = Int(felicidadeString) else {
            print("erro ao adicionar refeição")
            return
        }
        
        let refecao = Refeicao(name: nomeRefeicao, felicidade: felicidade)
       
        print("Comi \(refecao.name) fiquei com felicidade \(refecao.felicidade)!")
        
        
    }
    

}

