//
//  FlickerPhotoService.swift
//  FlickerPhotos
//
//  Created by Prakashini Pattabiraman on 15/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation

public class FlickerPhotoService : APIResource {
    
    var text: String = ""
    var requestMethod: String = "GET"
    //var requestURL: String = ""
    
    public static let sharedInstance = FlickerPhotoService()
    
    func getFlickrImagesForSearchKey(query:String, complitionHandler:@escaping (_ photoList:[FlickrPhoto]?, _ error: Error?) -> Void ) {
        var photosArr : [FlickrPhoto] = []
        let flickrServiceUtil = FlickrServiceUtil.sharedInstance
        var text : String {
            return query
        }
        
        
        flickrServiceUtil.makeRequest(url: url, requestMethod: requestMethod) { (data, error) in
            guard let dataFromRequest = data else {
                complitionHandler(nil, NSError.init(domain: "com.flickrsearch.error", code: 300, userInfo: NSDictionary.init(objects: ["No Data" as NSCopying], forKeys: ["description" as NSCopying]) as! [String : Any]) as Error)
                return
            }
            guard let json = try? JSONSerialization.jsonObject(with: dataFromRequest as! Data, options: .mutableContainers) else {
                complitionHandler(nil, error as? NSError )
                return
            }
            guard let jsonObj = json as? [String : Any] else {
                return
            }
            
            let photoObj  = jsonObj["photos"] as? [String : AnyObject]
           
            let photoParentObj = FlickrPhotoParent(photoObj!)
            photoParentObj.storePageDetailsToUserDefaults()
           
            let photoArrObj = photoObj!["photo"] as? [AnyObject]
            for photo in photoArrObj!  {
                    let flickrPhotoObj = FlickrPhoto.init(photo as! [String : Any])
                    photosArr.append(flickrPhotoObj)
                }
            print("\(photosArr)")
            complitionHandler(photosArr, nil)
        }
    }
}
