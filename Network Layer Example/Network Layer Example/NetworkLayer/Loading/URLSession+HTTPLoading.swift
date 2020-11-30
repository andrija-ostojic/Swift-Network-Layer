//
//  URLSession+HTTPLoading.swift
//  Network Layer Example
//
//  Created by Andrija Ostojić on 30/11/2020.
//

import Foundation

extension URLSession: HTTPLoading {
    
    public func load(request: HTTPRequest, completion: @escaping (HTTPResult) -> Void) {
        guard let url = request.url else {
            // we couldn't construct a proper URL out of the request's URLComponents
            completion(.failure(HTTPError.init(code: .invalidRequest, request: request, response: nil, underlyingError: nil)))
            return
        }
        
        // construct the URLRequest
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        // copy over any custom HTTP headers
        for (header, value) in request.headers {
            urlRequest.addValue(value, forHTTPHeaderField: header)
        }
        
        if request.body.isEmpty == false {
            // if our body defines additional headers, add them
            for (header, value) in request.body.additionalHeaders {
                urlRequest.addValue(value, forHTTPHeaderField: header)
            }
            
            // attempt to retrieve the body data
            do {
                urlRequest.httpBody = try request.body.encode()
            } catch {
                // something went wrong creating the body; stop and report back
                completion(.failure(HTTPError(code: .invalidRequest, request: request, response: nil, underlyingError: nil)))
                return
            }
        }
        
        let dataTask = self.dataTask(with: urlRequest) { (data, response, error) in
            // construct a Result<HTTPResponse, HTTPError> out of the triplet of data, url response, and url error
            
            var httpResponse: HTTPResponse?
            if let r = response as? HTTPURLResponse {
                httpResponse = HTTPResponse(request: request, response: r, body: data ?? Data())
            }
            //TODO: Better initializng of result value
            if let e = error as? URLError {
                let code: HTTPError.Code
                switch e.code {
                    case .badURL: code = .invalidRequest
                    default: code = .unknown
                }
                completion(.failure(HTTPError(code: code, request: request, response: httpResponse, underlyingError: e)))
            } else if let someError = error {
                // an error, but not a URL error
                completion(.failure(HTTPError(code: .unknown, request: request, response: httpResponse, underlyingError: someError)))
            } else if let r = httpResponse {
                // not an error, and an HTTPURLResponse
                completion(.success(r))
            } else {
                // not an error, but also not an HTTPURLResponse
                completion(.failure(HTTPError(code: .invalidResponse, request: request, response: nil, underlyingError: error)))
            }
        }
        
        // off we go!
        dataTask.resume()
    }
}
