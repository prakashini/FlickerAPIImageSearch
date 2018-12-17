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
         UserDefaults.standard.set(1, forKey: "page")
        interactor?.fetchPhotosForSearchQuery(query: query)
    }
    
    func doMoreFlickrImageSearchFor(searchQuery query: String) {
       
        setPageNumberToFetchFreshQueries()
        interactor?.fetchPhotosForSearchQuery(query: query)
    }
    
    fileprivate func setPageNumberToFetchFreshQueries() {
        var currentPageNo : Int = UserDefaults.standard.integer(forKey: "page")
        currentPageNo = currentPageNo + 1
        
        let totalPageNumber : Int = UserDefaults.standard.integer(forKey: "pages")
        if(currentPageNo < totalPageNumber) {
            UserDefaults.standard.set(currentPageNo, forKey: "page")
        }
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
