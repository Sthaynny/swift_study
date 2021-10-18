//
//  ViewController.swift
//  swift_study
//
//  Created by Igor Sthaynny on 18/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nomeTextFild: UITextField!
    @IBOutlet var felicidadeTextFild: UITextField!

  
    @IBAction func adicionar(_ sender: Any) {
        let nome = nomeTextFild.text
        let felicidade = felicidadeTextFild.text
        
        print("Comi \(nome) fiquei com felicidade \(felicidade)!")
    }
    

}

