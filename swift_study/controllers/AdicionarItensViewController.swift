//
//  AdicionarItensViewController.swift
//  swift_study
//
//  Created by Igor Sthaynny on 01/11/21.
//

import UIKit

class AdicionarItensViewController: UIViewController {
    
    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: -  IBAction
    
    @IBAction func adicionarItem(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}
