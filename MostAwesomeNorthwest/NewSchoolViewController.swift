//
//  NewSchoolViewController.swift
//  MostAwesomeNorthwest
//
//  Created by Moyer,David C on 3/14/19.
//  Copyright © 2019 Moyer,David C. All rights reserved.
//

import UIKit

class NewSchoolViewController: UIViewController {

    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var CoachTF: UITextField!
    
    var newSchool:School!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func done(_ sender: Any) {
        let name = NameTF.text!
        let coach = CoachTF.text!
        
        Schools.shared.add(school: School(name: name, coach: coach))
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
