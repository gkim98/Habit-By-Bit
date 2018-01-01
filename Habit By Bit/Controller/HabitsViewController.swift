//
//  HabitsViewController.swift
//  Habit By Bit
//
//  Created by Grant Kim on 12/31/17.
//  Copyright © 2017 2.5 Yellow. All rights reserved.
//

import UIKit

class HabitsViewController: UIViewController {

    @IBOutlet weak var habitsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - table view

extension HabitsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpTableView() {
        habitsTableView.delegate = self
        habitsTableView.dataSource = self
        habitsTableView.register(UINib(nibName: "HabitCell", bundle: nil), forCellReuseIdentifier: "habitCell")
        configureTableView()
    }
    
    func configureTableView() {
        habitsTableView.rowHeight = UITableViewAutomaticDimension
        habitsTableView.estimatedRowHeight = 200.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as! HabitCell
        return cell
    }
    
    
}
