//
//  APIService.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import Foundation
import Alamofire

struct APIService {
    // Singleton
    static let shared = APIService()
    
    func getAllCountries(url: URL) async -> [Country]? {
        
        let taskRequest = AF.request(url, method: .get, encoding: JSONEncoding.default).validate().cURLDescription { curl in
            print("📡 cURL:\n\(curl)")
        }
        let response = await taskRequest.serializingData().response
        print(url)
        switch response.result {
        case .success(let data):
            print("Successfully got all countries")
            do {
                return try JSONDecoder().decode([Country].self, from: data)
            } catch{
                print("Error decoding: \(error)")
                return nil
            }
            
        case .failure(let error):
            print("Failure getting countries:", error.localizedDescription)
            return nil
        }
    }
}
