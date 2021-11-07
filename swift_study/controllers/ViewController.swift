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

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate, AdicionarItensDelete {
     
    
    
    
    // MARK: - ATRIBUTOS
    var delegate: AdicionaRefeicaoDelegate?
    var itens: [Item] = [
        Item(nome: "Queijo", calorias: 51.1),
        Item(nome: "Tomate", calorias: 51.1),
        Item(nome: "Arroz", calorias: 51.1),
        Item(nome: "Calabresa", calorias: 51.1),
        Item(nome: "Bacon", calorias: 51.1),
        Item(nome: "Molho apimentado", calorias: 51.1),
        
    ]
    var itensSelecionados: [Item] = []
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = itens[indexPath.row].nome
        return celula;
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else {
            return
        }
        
        if celula.accessoryType == .none{
            celula.accessoryType = .checkmark
            itensSelecionados.append(itens[indexPath.row])
        }else{
            celula.accessoryType = .none
            let item = itens[indexPath.row]
            if let posicao = itensSelecionados.firstIndex(of: item){
                itensSelecionados.remove(at: posicao)
            }
            
        }
        

    }
    
    
    // MARK: - IBOutlets
    
    @IBOutlet var nomeTextFild: UITextField?
    @IBOutlet var felicidadeTextFild: UITextField?
    @IBOutlet weak var itensTableView: UITableView?
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        let botaoAdicionaItem = UIBarButtonItem(title: "Add Item", style: .plain, target: self,  action: #selector(self.adicionarItem))
        navigationItem.rightBarButtonItem = botaoAdicionaItem
    }
    
    @objc func adicionarItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        guard let tableView = itensTableView else {
            let alerta = UIAlertController(title: "Desculpa!!", message: "Algo de errado aconteceu... Tente novamente", preferredStyle: .alert)
            let fechar = UIAlertAction(title: "fechar", style: .cancel, handler: nil)
            alerta.addAction(fechar)
            present(alerta, animated: true, completion: nil)
            return
        }

        itens.append(item)
        
        tableView.reloadData()
        
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        guard let nomeRefeicao = nomeTextFild?.text , let felicidadeString = felicidadeTextFild?.text , let felicidade = Int(felicidadeString) else {
            print("erro ao adicionar refeição")
            return
        }
        
        let refeicao = Refeicao(name: nomeRefeicao, felicidade: felicidade, itens: itensSelecionados)
       
        print("Comi \(refeicao.name) fiquei com felicidade \(refeicao.felicidade)!")
        
        
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
        
    }
    

}

