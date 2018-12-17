//
//  FlickerPhotoListPresenter.swift
//  FlickerPhotos
//
//  Created by Prakashini Pattabiraman on 15/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation
import UIKit

class FlickrPhotoListPresenter : FlickrPhotoListPresenterProtocol {
    var view: FlickrPhotoListViewProtocol?
    
    var interactor: FlickrPhotoListInteractorInputProtocol?
    
    var wireframe: FlickrPhotoListWireFrameProtocol?
    
    func viewDidLoad() {
        
    }
    
    func updateView() {
        
    }
    
    func doFlickrImageSearchFor(searchQuery query:String) {
        interactor?.fetchPhotosForSearchQuery(query: query)
    }

    
}

extension FlickrPhotoListPresenter : FlickrPhotoListInteractorOutputProtocol {
    func didFetchPhotos(photoList: [FlickrPhoto]) {
        view?.updateView(photoList: photoList)
    }
    
    func OnError(error: NSError) {
        view?.showError(error: error)
    }
    
    
}
