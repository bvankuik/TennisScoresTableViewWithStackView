//
//  ViewController.swift
//  TennisScoresTableViewWithStackView
//
//  Created by Bart van Kuik on 18/09/2018.
//  Copyright © 2018 DutchVirtual. All rights reserved.
//
// AppIcon from https://en.m.wikipedia.org/wiki/File:Tennis_ball.svg
// by Wikipedia user MesserWoland

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    private let tableView = UITableView()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return globalTournament.contests.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalTournament.contests[section].results.count + 1// add one for the first "final" row
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return globalTournament.contests[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScoreCell", for: indexPath) as? ScoreCell else {
            fatalError("Incorrect class registered with tableView")
        }
        
        if indexPath.row == 0 {
            if let first = globalTournament.contests[indexPath.section].results.first {
                cell.rounds = first.scores.count
            } else {
                cell.rounds = 0
            }
        } else {
            cell.result = globalTournament.contests[indexPath.section].results[indexPath.row - 1]
        }
        return cell
    }
    
    override func viewDidLoad() {
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.register(ScoreCell.self, forCellReuseIdentifier: "ScoreCell")
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.view.addSubview(self.tableView)
        
        let guide = self.view.safeAreaLayoutGuide
        let constraints = [
            self.tableView.leadingAnchor.constraintEqualToSystemSpacingAfter(guide.leadingAnchor, multiplier: 1),
            self.tableView.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1),
            guide.trailingAnchor.constraintEqualToSystemSpacingAfter(self.tableView.trailingAnchor, multiplier: 1),
            guide.bottomAnchor.constraintEqualToSystemSpacingBelow(self.tableView.bottomAnchor, multiplier: 1)
        ]
        
        self.view.addConstraints(constraints)
    }
}
