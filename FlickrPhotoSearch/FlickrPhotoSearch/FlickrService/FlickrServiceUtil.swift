//
//  FlickrServiceUtil.swift
//  FlickerPhotos
//
//  Created by Prakashini Pattabiraman on 15/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation

public class FlickrServiceUtil {
    
    public static let sharedInstance = FlickrServiceUtil()
    
    func makeRequest(url:String, requestMethod:String, completion:@escaping (_ result : Any?, _ error: Any?) -> Void) {
        let request = getRequest(requestMethod: requestMethod, url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let data = data else {
                completion(nil, error)
                return
            }
            completion(data, nil)
        }
        task.resume()
    }
    
    private func getRequest(requestMethod:String, url:String) -> URLRequest {
        let escapedURL:String = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let request = URLRequest(url: URL(string: escapedURL)!)
        //request.httpMethod = requestMethod
       // request.timeoutInterval = 2
        return request
    }
}


