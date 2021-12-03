//
//  MatchView.swift
//  test
//
//  Created by Asliddin Rasulov on 02/12/21.
//

import UIKit

class MatchView: UIView {
    
    @IBOutlet weak var dateLabel: UILabel?
    @IBOutlet weak var timeLabel: UILabel?
    @IBOutlet weak var teamOneImageView: UIImageView?
    @IBOutlet weak var teamTwoImageView: UIImageView?
    @IBOutlet weak var teamOneNameLabel: UILabel?
    @IBOutlet weak var teamTwoNameLabel: UILabel?
    @IBOutlet weak var teamOneScoreLabel: UILabel?
    @IBOutlet weak var teamTwoScoreLabel: UILabel?
    @IBOutlet weak var tournamentNameLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func configure(model: MatchInfoResponse) {
        dateLabel?.text = String(model.date?.split(separator: " ")[0] ?? "")
        timeLabel?.text = String(model.date?.split(separator: " ")[1].dropLast(4) ?? "")
        teamOneNameLabel?.text = model.team1.name_eng
        teamTwoNameLabel?.text = model.team2.name_eng
        teamOneScoreLabel?.text = "\(model.team1.score ?? 0)"
        teamTwoScoreLabel?.text = "\(model.team2.score ?? 0)"
        tournamentNameLabel?.text = model.tournament.name_eng
    }
}
