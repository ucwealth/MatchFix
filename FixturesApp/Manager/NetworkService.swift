//  Created on 13/05/2023

import Foundation

class NetworkService {
    static let shared = NetworkService()
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    func makeRequest<T: Decodable>(with url: URL,
                                   method: HTTPMethod = .get,
                                   responseType: T.Type,
                                   completion: @escaping (Result<T, Error>) -> Void) {
        
        let cache = URLCache(
            memoryCapacity: 1024 * 1024 * 512,
            diskCapacity: 1024 * 1024 * 1024 * 100,
            diskPath: "Cache.db"
        )

        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.urlCache = cache

        let session = URLSession(configuration: sessionConfiguration)

        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue(MessagesConstant.API_TOKEN, forHTTPHeaderField: "X-Auth-Token")
        
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            if let error = error {
                   completion(.failure(error))
                   return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch let error {
                completion(.failure(error))
            }
        }.resume()
    }

}
