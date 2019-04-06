//
//  SchoolsTableViewController.swift
//  MostAwesomeNorthwest
//
//  Created by Moyer,David C on 3/14/19.
//  Copyright © 2019 Moyer,David C. All rights reserved.
//

import UIKit

class SchoolsTableViewController: UITableViewController {
    
    // create a local reference array containing all the Schools
    var schoolArray:[School]?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            Schools.shared.delete(shared: Schools.shared[indexPath.row])
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolArray?.count ?? 0 //Schools.shared.numSchools()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "schoolCell", for: indexPath)
        

        cell.textLabel?.text = schoolArray![indexPath.row].name
        cell.detailTextLabel?.text = schoolArray![indexPath.row].coach
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "teamSegue" {
            let teamsTVC = segue.destination as! TeamsTableViewController
            teamsTVC.school = Schools.shared[tableView.indexPathForSelectedRow!.row]
        }
    }
    

}
