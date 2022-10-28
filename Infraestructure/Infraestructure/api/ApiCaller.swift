//
//  ApiCaller.swift
//  Infraestructure
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 20/10/22.
//

import Foundation
import Alamofire

struct Constanst {
    static let baseURL = "https://api.themoviedb.org/3"
    static let api_key = "4005b57c0bfee0310d6958d0c8683128"
}


public struct APICaller {
    
    let queue = DispatchQueue(label: "getMovies", qos: .utility, attributes: .concurrent)
    
    public func fetchMovies(with urlString: String, completion: @escaping([Movie]?)->Void){
        get(url: urlString) { response in
            if (response.error != nil){
                return
            }
        
            let movies = parseJSON(response.data!)
            completion(movies)
        }
    }
    
    
    func parseJSON(_ MovieData: Data) -> [Movie]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MovieResult.self, from: MovieData)
            return decodedData.results
        } catch  {
            print(error)
            return nil
        }
                
    }
    
    private func get(url: String, completion: @escaping(DataResponse<MovieResult, AFError>)->Void){
        AF.request(url).responseDecodable(of: MovieResult.self, queue: queue ) { response in
            completion(response)
        }
    }
    
}
