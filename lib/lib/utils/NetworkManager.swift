//
//  NetworkManager.swift
//  demo
//
//  Created by Diego Salcedo on 12/09/22.
//

import Foundation
import Alamofire

struct NetworkManager {
    
    open class MyServerTrustPolicyManager: ServerTrustPolicyManager {
        open override func serverTrustPolicy(forHost host: String) -> ServerTrustPolicy? {
            return ServerTrustPolicy.disableEvaluation
        }
    }
    
    enum Errors: Int {
        case wrongAppVersion = -3
        case unexpectedResponse = -2
        case unknown = -1
        case timeout = 0
        case unauthorized = 401
    }
    
    struct ApiError {
        let code: Int
        let message: String?
        let requestEndpoint: String
        let args: [String: Any]?
    }
    
    static let authorizedSharedManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = Constants.Network.TIMEOUT
        configuration.timeoutIntervalForResource = Constants.Network.TIMEOUT
        
        
        let retval = SessionManager(configuration: configuration, delegate: SessionDelegate(), serverTrustPolicyManager: MyServerTrustPolicyManager(policies: [:]))
        retval.adapter = JWTAccessTokenAdapter()
        retval.retrier = MyRetrier()
        
        return retval
    }()
    
    static let unauthorizedSharedManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = Constants.Network.TIMEOUT
        configuration.timeoutIntervalForResource = Constants.Network.TIMEOUT
        
        let retval = SessionManager(configuration: configuration, delegate: SessionDelegate(), serverTrustPolicyManager: MyServerTrustPolicyManager(policies: [:]))
        retval.adapter = MyAdapter()
        retval.retrier = MyRetrier()
        
        return retval
    }()
    
    
    static func handleError(error: Error,
                            response: HTTPURLResponse?,
                            endpoint: String) -> ApiError {
        if error._code == NSURLErrorTimedOut {
            return ApiError(code: Errors.timeout.rawValue,
                            message: error.localizedDescription,
                            requestEndpoint: endpoint,
                            args: nil)
        }
        
        if let response = response {
            if response.statusCode == 401 {
                return ApiError(code: Errors.unauthorized.rawValue,
                                message: error.localizedDescription,
                                requestEndpoint: endpoint,
                                args: nil)
            }
            
            return ApiError(code: response.statusCode,
                            message: error.localizedDescription,
                            requestEndpoint: endpoint,
                            args: nil)
        }
        
        return ApiError(code: Errors.unknown.rawValue,
                        message: error.localizedDescription,
                        requestEndpoint: endpoint,
                        args: nil)
    }
    
    static func getBodyError(data: Data?) -> [String: Any]? {
        if let data = data,
            let json = try? JSONSerialization.jsonObject(with: data, options: []),
            let dictionary = json as? [String: Any] {
            return dictionary
        }
        
        return nil
    }
}

// MARK: JWT Access Token Adapter
final class JWTAccessTokenAdapter: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        let accessToken = "customToken"
        urlRequest.setValue("Bearer " + accessToken, forHTTPHeaderField: "Authorization")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
}

final class MyAdapter: RequestAdapter {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return urlRequest
    }
}

final class MyRetrier: RequestRetrier {
    func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {
        
        if let response = request.task?.response as? HTTPURLResponse, (response.statusCode == 401 || response.statusCode == 403) {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .tokenExpired, object: nil)
            }
            
        }

        completion(false, 0.0)
    }
}
