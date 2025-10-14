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
    
    func getAllCountries(url: URL) async {
        
        let taskRequest = AF.request(url, method: .get, encoding: JSONEncoding.default).validate()
        let response = await taskRequest.serializingData().response
        print(url)
        switch response.result {
        case .success(let data):
            print("Successfully got all countries")
            
        case .failure(let error):
            print("Failure getting countries:", error.localizedDescription)
        }
    }
}
