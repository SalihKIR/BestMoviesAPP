//
//  NetworkManager.swift
//  BestMoviesApi
//
//  Created by Salih KIR on 30.06.2022.
//

import Foundation
import UIKit

final class NetworkManager{
    init(){}
    
    let sesions = URLSession.shared
    func getdata<T: Codable>(url: String ,completion: @escaping (T?,String?) -> Void){
        let preparedURL = URL(string: url)
        let task = sesions.dataTask(with: preparedURL!) { (data , res, error) in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let responseObject = try JSONDecoder().decode(T.self, from: data)
                        completion(responseObject, nil)
                    }
                    catch{
                        print("Data Boş",error , error.localizedDescription)
                    }
                }
            }
    }
    task.resume()
    
    func postData<T: Codable, K: Encodable>(url: String, params: K, completion: @escaping (T?) -> Void) {
                
            }
}
}
