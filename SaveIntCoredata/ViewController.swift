//
//  ViewController.swift
//  SaveIntCoredata
//
//  Created by Duc Anh on 11/26/18.
//  Copyright © 2018 Duc Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let entity = try? AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] {
            textField.text = String(entity?.last?.int ?? 0) 
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveBtn(_ sender: UIBarButtonItem) {
        guard textField.text != "" else {return}
        let context = Entity(context: AppDelegate.context)
        context.int = (Int16(textField.text ?? "")) ?? 0
        AppDelegate.saveContext()
    }
    
}

