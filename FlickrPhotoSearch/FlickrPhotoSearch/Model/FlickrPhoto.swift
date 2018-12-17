//
//  FlickerPhoto.swift
//  FlickerPhotos
//
//  Created by Prakashini Pattabiraman on 15/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation

public struct FlickrPhoto {
    public var flickrPhotoId : String?
    public var flickrPhotoOwner : String?
    public var flickrPhotoSecret: String?
    public var flickrPhotoServer: String?
    public var flickrPhotoFarm:Int?
    public var flickrPhotoTitle : String?
    public var flickrPhotoIsfriend : Bool?
    public var flickrPhotoIsfamily: Bool
    
    public init(_ dictionary: [String: Any]) {
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
