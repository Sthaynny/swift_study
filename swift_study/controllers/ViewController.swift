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
    var itens: [Item] = []
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
        recuperarItens()
        
    }
    
    func recuperarItens() {
        itens = ItemDAO.load()
    }
    
    @objc func adicionarItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    
    func add(_ item: Item) {
        guard let tableView = itensTableView else {
            Alerta(controller: self).exibir()
            return
        }
        
        itens.append(item)
        
        tableView.reloadData()
        
        ItemDAO.save(itens)
        
    
    }
    
    func recuperaRefeicaoFormulario() -> Refeicao?{
        guard let nomeRefeicao = nomeTextFild?.text , let felicidadeString = felicidadeTextFild?.text , let felicidade = Int(felicidadeString) else {return nil}
        
        return Refeicao(name: nomeRefeicao, felicidade: felicidade, itens: itensSelecionados)
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        guard let refeicao = recuperaRefeicaoFormulario() else{
            Alerta(controller: self).exibir( mensagem: "Erro ao extrair dados da refeicao")
            return }
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
        
    }
    

}

