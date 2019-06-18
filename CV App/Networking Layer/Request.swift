//
//  MainInteractor.swift
//  CV App
//
//  Created by Jordy Xavier Pazaran Reyes on 6/3/19.
//  Copyright © 2019 Jordy Xavier Pazaran Reyes. All rights reserved.
//

import Foundation
// MARK: - URL Extension
extension URL{
    
    /// The method
    ///
    /// - Parameter queries: recive the queries that de URL needs
    /// - Returns: returns the URL with the queries
    func withQueries(_ queries: [String:String]) -> URL?{
        
        guard !queries.isEmpty else { return self }
        
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

class Request {
    // MARK: - Properties
    private let baseURL: URL
    
    public static let shared = Request(baseURL: Constants.url) //The base URL for all GET Request
    
    // MARK: - Enums
    enum NetworkingErrors: Error{//Define the errors that we can find when the app fetch the URL
        case netWorkError
        case invalidData
        case invalidRequest
    }
    
    // MARK: - Initialazers
    /// The init for the base URL
    ///
    /// - Parameter baseURL: URL base for the appi's request
    private init(baseURL: String) {
        self.baseURL = URL(string: baseURL)!
    }
    
    // MARK: - Methods
    /// This method allows to make the request to a especific URL with components sendings by the extension URL on the top. Also this method create a URL base it on a tokenID and a date
    ///
    /// - Parameters:
    ///   - queries: The queries of the URL, the key of the dictionary never gonna change
    ///   - petition: The kind of request GET/POST
    ///   - completionHandler: This completion handler recive a result compose by a data and a case of the NetworkinErrors enum and return a void
    func request<T:Codable>(_ endpoint: String, entity: T.Type, completionHandler: @escaping (Result<Data, NetworkingErrors>) -> Void){
        let url = baseURL.appendingPathComponent(endpoint) 
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, reponse, error  in
            guard error == nil else{
                completionHandler(.failure(.netWorkError)) // Network error case
                return
            }
            guard let dataFetched = data, let _ : T = self.jsonDecode(data: dataFetched) else{
                completionHandler(.failure(.invalidData))// Data error case
                return
            }
            completionHandler(.success(dataFetched))
            }.resume()//Resume task
    }
    
    /// This method its gonna decode the DATA recived by the completion Hander of the fuction request, using CODABLE and also the method expect to recive a generic T
    ///
    /// - Parameter data: the data recived by the completion handler
    /// - Returns: returns the json decode in an array
    func jsonDecode<T: Decodable>(data: Data) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            return try jsonDecoder.decode(T.self, from: data)
        } catch {
            print(error.localizedDescription)
            
        }
        return nil
    }
}
