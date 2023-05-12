//
//  MovieInfoService.swift
//  SOPT_Seminar_Task
//
//  Created by 곽성준 on 2023/05/11.
//

import Foundation
import Alamofire

class MovieInfoService{
    
    static let shared = MovieInfoService()
    
    private init() {}
    
    func Movie(completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = Config.baseURL
        
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                print("😿😿😿😿😿😿")
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure:
                print("🤝🤝🤝🤝🤝🤝🤝🤝")
                completion(.networkErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        print(statusCode)
        dump(data)
        switch statusCode{
        case 200: return isValidData(data: data)
        case 400,401,404,409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(MovieInfo.self, from: data) else { return .pathErr}
        
        return .success(decodedData as Any)
    }
    
}


