//
//  ViewController.swift
//  test
//
//  Created by Asliddin Rasulov on 01/12/21.
//

import UIKit

class MatchInfoViewController: UIViewController {

    @IBOutlet weak var matchView: MatchView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMatchInfo { [self] matchInfoResponse in
            matchView?.isHidden = false
            matchView?.configure(model: matchInfoResponse)
            matchView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapMatchView)))
        }
    }

    private func getMatchInfo(complation: @escaping(MatchInfoResponse) -> Void) {
        let params: [String: Any] = [
            "proc": "get_match_info",
            "params": [
                "_p_sport": 1,
               "_p_match_id": 1724836
            ]
        ]
        
        AFRequest.request.sendRequestWithBody(url: "https://api.instat.tv/test/data", method: .post, typeResponse: MatchInfoResponse.self, params: params) { matchInfoResponse in
            guard let matchInfoResponse = matchInfoResponse else { return }
            complation(matchInfoResponse)
        }
    }
    
    @objc private func didTapMatchView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let matchVideoVC = storyboard.instantiateViewController(identifier: "video") as! MatchVideoViewController
        navigationController?.pushViewController(matchVideoVC, animated: true)
    }
}

