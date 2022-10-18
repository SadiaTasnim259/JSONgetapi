//
//  APIcreate.swift
//  JSONgetapi
//
//  Created by Sadia on 17/10/22.
//

import Foundation

struct APIManager {
    
    func getData(completionHandler: @escaping (Result<ProductsList, Error>) -> () ){
        let mainURL = URLConstant.GET_ALL_PRODUCTS.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        if let url = URL(string: mainURL!){
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data {
                    let decoder = JSONDecoder()
                    do{
                        let decodedValue = try decoder.decode(ProductsList.self, from: data)
                        completionHandler(.success(decodedValue))
                    }
                    catch{
                        completionHandler(.failure(error))
                    }
                }
                if let error{
                    completionHandler(.failure(error))
                }
            }
            task.resume()
        }
    }
}

