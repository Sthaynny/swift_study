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

class ViewController: UIViewController , UITableViewDataSource{
    
    
    
    // MARK: - ATRIBUTOS
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [String] = ["test 1","test 1","test 1","test 1","test 1","test 1","test 1","test 1","test 1","test 1","test 1","test 1","test 1","test 1","test 1","test 1","test 1","test 1"]
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = itens[indexPath.row]
        return celula;
    }
    
    
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

