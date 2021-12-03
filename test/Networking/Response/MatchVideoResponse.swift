//
//  MatchVideoResponse.swift
//  test
//
//  Created by Asliddin Rasulov on 03/12/21.
//

class MatchVideoResponse: Codable {
    
    var video: [VideoModel] = []
    
    private enum CodingKeys: String, CodingKey {
        case video
    }
    
    required init(from decoder: Decoder) throws {
        
        var video = [VideoModel]()
        var container = try decoder.unkeyedContainer()
        while !container.isAtEnd {
            if let route = try? container.decode(VideoModel.self) {
                video.append(route)
            } else {
                _ = try? container.decode(DummyCodable.self) // <-- TRICK
            }
        }
        self.video = video
    }
}

private struct DummyCodable: Codable {}
