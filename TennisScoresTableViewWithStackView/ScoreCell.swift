//
//  ScoreCell.swift
//  TennisScoresTableViewWithStackView
//
//  Created by Bart van Kuik on 19/09/2018.
//  Copyright © 2018 DutchVirtual. All rights reserved.
//

import UIKit

class ScoreCell: UITableViewCell {
    private let scoreStackView = UIStackView()
    private var arrangedSubviews: [UIView] = []
    private let nameLabel = UILabel()
    
    var result: Result? {
        didSet {
            self.refreshResult()
        }
    }
    var rounds: Int? {
        didSet {
            self.refreshFinal()
        }
    }
    
    private func refreshResult() {
        if let result = self.result {
            self.textLabel?.text = result.name
            result.scores.forEach { score in
                let label = self.makeLabel(with: String(describing: score))
                self.arrangedSubviews.append(label)
                self.scoreStackView.addArrangedSubview(label)
            }
        }
    }
    
    private func refreshFinal() {
        if let rounds = self.rounds {
            self.textLabel?.text = "Final"
            (1 ... rounds).forEach { i in
                let label = self.makeLabel(with: String(describing: i))
                self.arrangedSubviews.append(label)
                self.scoreStackView.addArrangedSubview(label)
            }
        }
    }
    
    private func makeLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.text = text
        label.widthAnchor.constraint(equalToConstant: 40).isActive = true
        label.textAlignment = .right
        return label
    }
    
    override func prepareForReuse() {
        self.arrangedSubviews.forEach {
            self.scoreStackView.removeArrangedSubview($0)
        }
        self.arrangedSubviews = []
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        
        self.scoreStackView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.scoreStackView)
        
        let guide = self.contentView.safeAreaLayoutGuide
        let constraints = [
            self.scoreStackView.topAnchor.constraintEqualToSystemSpacingBelow(guide.topAnchor, multiplier: 1),
            guide.rightAnchor.constraintEqualToSystemSpacingAfter(self.scoreStackView.rightAnchor, multiplier: 1),
            guide.bottomAnchor.constraintEqualToSystemSpacingBelow(self.scoreStackView.bottomAnchor, multiplier: 1)
        ]
        self.contentView.addConstraints(constraints)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
