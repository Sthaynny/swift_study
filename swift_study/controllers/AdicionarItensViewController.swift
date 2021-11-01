//
//  AdicionarItensViewController.swift
//  swift_study
//
//  Created by Igor Sthaynny on 01/11/21.
//

import UIKit

protocol AdicionarItensDelete{
    func add(_ item:Item)
}

class AdicionarItensViewController: UIViewController {

    
    init(delegate: AdicionarItensDelete) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Atributros
    
    var delegate: AdicionarItensDelete?
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var nomeItemTextField: UITextField?
    @IBOutlet weak var caloriasTextField: UITextField?
    
    
    //MARK: -  IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        guard let nomeItem = nomeItemTextField?.text else {
            return
        }
        guard let caloriaString = caloriasTextField?.text , let calorias = Double(caloriaString) else {
            return
        }
        let Item = Item(nome: nomeItem, calorias: calorias);
        delegate?.add(Item)
        navigationController?.popViewController(animated: true)
    }
    

}
