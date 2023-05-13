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
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("X-Auth-Token", forHTTPHeaderField: MessagesConstant.API_TOKEN)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
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
