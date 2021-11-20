//
//  APIManager.swift
//  FabHotelsAssignment
//
//  Created by Shivi Agarwal on 15/11/21.
//

import Foundation

final class APIManager
{
    static let shared = APIManager()
    
    struct Constants {
        static let newsURL = URL(string: "https://api.npoint.io/7c27fa874f0a4d46e4d4")
        static let loginUrl = URL(string: "https://api.npoint.io/0774724810730d4ee184")
    }
    
    enum APIError: Error
    {
        case failedToFetchData
        case failedToDecodeData
    }
    
    public func getTopStories(completion: @escaping (Result<[Articles], Error>)-> Void)
    {
        guard let url = Constants.newsURL else {
            return
        }
        
        let _ = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                debugPrint(error)
                completion(.failure(APIError.failedToFetchData))
            }
            
            else if let data = data
            {
                do
                {
                    let result = try JSONDecoder().decode(NewsAPIResponse.self, from: data)
                    completion(.success(result.articles))
                }
                
                catch let error
                {
                    debugPrint(error)
                
                    completion(.failure(APIError.failedToDecodeData))
                }
            }
        }.resume()
    }
    
    public func getLoginDetailes(completion: @escaping (Bool)-> Void)
    {
        guard let url = Constants.loginUrl else {
            return
        }
        
        let _ = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                debugPrint(error)
                completion(false)
            }
            
            else if let data = data
            {
                do
                {
                    let result = try JSONDecoder().decode(LoginAPIResponse.self, from: data)
                    print(result.full_name)
                    print(result.token)
                    completion(true)
                }
                catch let error
                {
                    debugPrint(error)
                
                    completion(false)
                }
            }
        }.resume()
    }
}
