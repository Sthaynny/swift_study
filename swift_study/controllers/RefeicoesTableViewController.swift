//
//  RefeicoesTableViewController.swift
//  swift_study
//
//  Created by Igor Sthaynny on 29/10/21.
//

import Foundation
import UIKit


class RefeicoesTableViewController: UITableViewController{
    let refeicoes = [
        Refeicao(name: "Pizza", felicidade: 5),
        Refeicao(name: "Feijão", felicidade: 5),
        Refeicao(name: "Macarrão", felicidade: 4),
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = refeicoes[indexPath.row].name
        
        return celula
    }
}
