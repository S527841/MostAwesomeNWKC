//
//  StudentsViewController.swift
//  MostAwesomeNorthwest
//
//  Created by Moyer,David C on 3/14/19.
//  Copyright © 2019 Moyer,David C. All rights reserved.
//

import UIKit

class StudentsViewController: UIViewController {

    var chosenTeam: Team!
    
    @IBOutlet weak var student0LBL: UILabel!
    
    @IBOutlet weak var student1LBL: UILabel!
    
    @IBOutlet weak var student2LBL: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        student0LBL.text = chosenTeam.students[0]
        student1LBL.text = chosenTeam.students[1]
        student2LBL.text = chosenTeam.students[2]
        
        self.navigationItem.title = chosenTeam.name
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
