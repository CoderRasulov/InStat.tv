//
//  MatchVideoViewController.swift
//  test
//
//  Created by Asliddin Rasulov on 02/12/21.
//

import UIKit
import AVKit
import AVFoundation

class MatchVideoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    
    private var videoModel: [VideoModel] = []
    private var player = AVPlayer()
    private var playerViewController = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getMatchVideo { [self] matchVideoResponse in
            videoModel = matchVideoResponse.video
            tableView?.reloadData()
        }
    }
    
    private func getMatchVideo(complation: @escaping(MatchVideoResponse) -> Void) {
        let params: [String: Any] = [
            "match_id": 1724836,
            "sport_id": 1
        ]

        AFRequest.request.sendRequestWithBody(url: "https://api.instat.tv/test/video-urls", method: .post, typeResponse: MatchVideoResponse.self, params: params) { matchVideoResponse in
            guard let matchVideoResponse = matchVideoResponse else { return }
            complation(matchVideoResponse)
        }
    }
    
    private func playVideo(at indexPath: IndexPath) {
        let selectVideo = videoModel[indexPath.row]
        guard let videoURL = URL(string: selectVideo.url ??  "") else { return }
        player = AVPlayer(url: videoURL)
        playerViewController.player = player
        present(playerViewController, animated: true) {
            self.playerViewController.player?.play()
        }
    }
}

extension MatchVideoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VideoTableViewCell.identifire, for: indexPath) as! VideoTableViewCell
        let video = videoModel[indexPath.row]
        cell.video = video
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        playVideo(at: indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
