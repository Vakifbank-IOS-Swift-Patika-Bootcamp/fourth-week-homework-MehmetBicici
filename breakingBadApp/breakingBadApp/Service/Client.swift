//
//  Client.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 21.11.2022.
//

import Foundation

final class Client {
    
    enum Endpoints {
        
        static let base = "https://www.breakingbadapi.com/api"
        
        case listOfAllChars
        case charDetails(Int)
        case quotes(String)
        case listOfAllEpisodes(String)
        case episodeDetails(Int)
        
        var stringValue: String {
            switch self {
            case .listOfAllChars:
                return Endpoints.base + "/characters"
            case .charDetails(let charId):
                return Endpoints.base + "/characters/\(charId)"
            case .quotes(let quotesOwner):
                return Endpoints.base + "/quote?author=\(quotesOwner)"
            case .listOfAllEpisodes(let seriesName):
                return Endpoints.base + "/episodes?series=\(seriesName)"
            case .episodeDetails(let episodesId):
                return Endpoints.base + "/episodes/\(episodesId)"
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    @discardableResult
    class func taskForGETRequest<ResponseType: Decodable>(url: URL, responseType: ResponseType.Type, completion: @escaping (ResponseType?, Error?) -> Void) -> URLSessionDataTask {
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                let responseObject = try decoder.decode(ResponseType.self, from: data)
                DispatchQueue.main.async {
                    completion(responseObject, nil)
                }
            } catch {
                do {
                    let errorResponse = try decoder.decode(BaseResponse.self, from: data) as Error
                    DispatchQueue.main.async {
                        completion(nil, errorResponse)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }
        task.resume()
        return task
    }
    
    class func getListOfAllChars(completion: @escaping ([ListOfAllCharsModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.listOfAllChars.url, responseType: [ListOfAllCharsModel].self) { response, error in
            if let response = response {
                completion(response, nil)
                
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getCharDetails(id: Int, completion: @escaping ([CharDetailsModels]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.charDetails(id).url, responseType: [CharDetailsModels].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getQuotes(quotesOwner: String, completion: @escaping ([QuotesModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.quotes(quotesOwner).url, responseType: [QuotesModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getListOfAllEpisodes(seriesName: String, completion: @escaping ([ListOfAllEpisodesModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.listOfAllEpisodes(seriesName).url, responseType: [ListOfAllEpisodesModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
    
    class func getEpisodeDetails(id: Int ,completion: @escaping ([EpisodeDetailsModel]?, Error?) -> Void) {
        taskForGETRequest(url: Endpoints.episodeDetails(id).url, responseType: [EpisodeDetailsModel].self) { response, error in
            if let response = response {
                completion(response, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
