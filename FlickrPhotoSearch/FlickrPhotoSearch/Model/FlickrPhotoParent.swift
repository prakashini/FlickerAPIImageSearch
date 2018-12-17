//
//  FlickrPhotoParentObj.swift
//  FlickrPhotoSearch
//
//  Created by LHUser on 17/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation

struct FlickrPhotoParent {
    var pageNumber : Int?
    var noOfPages : Int?
    
    init (_ dictionary: [String: Any]) {
        self.pageNumber = dictionary["page"] as? Int ?? 0
        self.noOfPages = dictionary["pages"] as? Int ?? 0
    }
    
    func storePageDetailsToUserDefaults(){
        UserDefaults.standard.set(self.pageNumber, forKey: "page")
        UserDefaults.standard.set(self.noOfPages, forKey: "pages")

    }
    
}


