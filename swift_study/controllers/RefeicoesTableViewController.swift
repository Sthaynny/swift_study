//
//  RefeicoesTableViewController.swift
//  swift_study
//
//  Created by Igor Sthaynny on 29/10/21.
//

import Foundation
import UIKit


class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    var refeicoes: [Refeicao] = []
    
    override func viewDidLoad() {
        refeicoes = RefeicaoDAO.load()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = refeicoes[indexPath.row].name
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        return celula
    }
    
    func add(_ refeicao:Refeicao) {
        refeicoes.append(refeicao)
        tableView.reloadData()
        RefeicaoDAO.save(refeicoes)
    }
    
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer){
        if gesture.state == .began{
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else{ return }
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(controller: self).exibi(refeicao: refeicao, handler:
                { alert in
                self.refeicoes.remove(at: indexPath.row)
                self.tableView.reloadData()
                
            })
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "adicionar"{
            if let viewController = segue.destination as? ViewController{
                viewController.delegate = self
            }
        }
        
    }
}
