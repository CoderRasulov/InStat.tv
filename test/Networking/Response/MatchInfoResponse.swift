//
//  MatchInfoResponse.swift
//  test
//
//  Created by Asliddin Rasulov on 02/12/21.
//

class MatchInfoResponse: Codable {
    
    var calc: Bool? = nil
    var date: String? = nil
    var has_video: Bool? = nil
    var live: Bool? = nil
    var storage: Bool? = nil
    var sub: Bool? = nil
    var team1: TeamModel = TeamModel()
    var team2: TeamModel = TeamModel()
    var tournament: TournamentModel = TournamentModel()
        
    private enum CodingKeys: String, CodingKey {
        case calc, date, has_video, live, storage, sub, team1, team2, tournament
    }
   
    required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        calc = try container.decode(Bool.self, forKey: .calc)
        date = try container.decode(String.self, forKey: .date)
        has_video = try container.decode(Bool.self, forKey: .has_video)
        live = try container.decode(Bool.self, forKey: .live)
        storage = try container.decode(Bool.self, forKey: .storage)
        sub = try container.decode(Bool.self, forKey: .sub)
        team1 = try container.decode(TeamModel.self, forKey: .team1)
        team2 = try container.decode(TeamModel.self, forKey: .team2)
        tournament = try container.decode(TournamentModel.self, forKey: .tournament)
    }
}
