//
//  VideoTableViewCell.swift
//  test
//
//  Created by Asliddin Rasulov on 03/12/21.
//

import UIKit
import AVKit

class VideoTableViewCell: UITableViewCell {
    
    static let identifire: String = "VideoTableViewCell"
    
    @IBOutlet weak var thumbnailImageView: UIImageView?
    
    var video: VideoModel? {
        didSet {
            updateUI()
        }
    }
    
    private func updateUI() {
        thumbnailImageView?.layer.cornerRadius = 8
        thumbnailImageView?.layer.masksToBounds = true
    }
}
