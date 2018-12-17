//
//  FlickerPhoto.swift
//  FlickerPhotos
//
//  Created by Prakashini Pattabiraman on 15/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation

public struct FlickrPhoto {
    var flickrPhotoId : String?
    var flickrPhotoOwner : String?
    var flickrPhotoSecret: String?
    var flickrPhotoServer: String?
    var flickrPhotoFarm:Int?
    var flickrPhotoTitle : String?
    var flickrPhotoIsfriend : Bool?
    var flickrPhotoIsfamily: Bool
    
    init(_ dictionary: [String: Any]) {
        self.flickrPhotoId = dictionary["id"] as? String ?? ""
        self.flickrPhotoOwner = dictionary["owner"] as? String ?? ""
        self.flickrPhotoSecret = dictionary["secret"] as? String ?? ""
        self.flickrPhotoServer = dictionary["server"] as? String ?? ""
        self.flickrPhotoFarm = dictionary["farm"] as? Int ?? 0
        self.flickrPhotoTitle = dictionary["title"] as? String ?? ""
        self.flickrPhotoIsfamily = dictionary["isfamily"] as? Bool ?? false
        self.flickrPhotoIsfriend = dictionary["isfriend"] as? Bool ?? false
    }
}
