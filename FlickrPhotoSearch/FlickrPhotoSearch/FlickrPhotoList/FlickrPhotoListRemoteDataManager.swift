//
//  FlickerPhotoListRemoteDataManager.swift
//  FlickerPhotos
//
//  Created by Prakashini Pattabiraman on 15/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation
import UIKit

class FlickrPhotoListRemoteDataManager : FlickrPhotoListRemoteDataManagerInputProtocol {
    var remoteRequestHandler: FlickrPhotoListRemoteDataManagerOutputProtocol?
    
    func fetchPhotosForSearchQuery(query: String) {
        let flickrService = FlickerPhotoService.sharedInstance
        flickrService.getFlickrImagesForSearchKey(query: query) {(photoList, error) in
            if photoList == nil {
                self.remoteRequestHandler?.onError(error: error! as NSError)
                return
            }
            guard let photoArr = photoList! as? [FlickrPhoto] else {
                self.remoteRequestHandler?.onError(error: error! as NSError)
                return
            }
            self.remoteRequestHandler?.onPhotoListFetchSucceed(photoList: photoArr)
        }
    }
    
    
}
