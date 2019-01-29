//
//  EmailsViewController.swift
//  MSIT - Notifier
//
//  Created by Abhishek Sansanwal on 18/01/19.
//  Copyright © 2019 Verved. All rights reserved.
//

import UIKit

class EmailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension EmailsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = ""
        cell.detailTextLabel?.text = ""
        return cell 
        
    }
    
}
