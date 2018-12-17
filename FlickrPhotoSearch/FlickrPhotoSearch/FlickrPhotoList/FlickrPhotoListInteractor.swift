//
//  FlickerPhotoListInteractor.swift
//  FlickerPhotos
//
//  Created by Prakashini Pattabiraman on 15/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation
import UIKit

class FlickrPhotoListInteractor : FlickrPhotoListInteractorInputProtocol {
    var interactor: FlickrPhotoListInteractorOutputProtocol?
    
    var remoteDataManager: FlickrPhotoListRemoteDataManagerInputProtocol?
    
    func fetchPhotosForSearchQuery(query: String) {
        remoteDataManager?.fetchPhotosForSearchQuery(query: query)
    }
    
    
}

extension FlickrPhotoListInteractor : FlickrPhotoListRemoteDataManagerOutputProtocol {
    func onPhotoListFetchSucceed(photoList: [FlickrPhoto]) {
        interactor?.didFetchPhotos(photoList: photoList)
    }
    
    func onError(error: NSError) {
        interactor?.OnError(error: error)
    }
    

    
    
}
