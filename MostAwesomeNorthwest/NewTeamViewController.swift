//
//  NewTeamViewController.swift
//  MostAwesomeNorthwest
//
//  Created by Moyer,David C on 3/14/19.
//  Copyright © 2019 Moyer,David C. All rights reserved.
//

import UIKit

class NewTeamViewController: UIViewController {

    @IBOutlet weak var teamNameTF: UITextField!
    @IBOutlet weak var student0TF: UITextField!
    @IBOutlet weak var student1TF: UITextField!
    @IBOutlet weak var student2TF: UITextField!
    
    var chosenSchool: School!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func done(_ sender: Any) {
        if !((teamNameTF.text?.isEmpty)! && (student0TF.text?.isEmpty)! && (student1TF.text?.isEmpty)! && (student2TF.text?.isEmpty)!) {
            let team = Team(name: teamNameTF.text!, students: [student0TF.text!,student1TF.text!,student2TF.text!])
            chosenSchool.teams.append(team)
            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
