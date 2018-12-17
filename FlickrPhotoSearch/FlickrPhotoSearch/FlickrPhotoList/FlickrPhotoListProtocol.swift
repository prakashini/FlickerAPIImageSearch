//
//  FlickerPhotoListProtocol.swift
//  FlickerPhotos
//
//  Created by Prakashini Pattabiraman on 15/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation
import UIKit

protocol FlickrPhotoListWireFrameProtocol :class {
    static func createFlickrPhotoListModule() -> UIViewController
}

protocol FlickrPhotoListPresenterProtocol:class {
    var view : FlickrPhotoListViewProtocol? { get set }
    var interactor : FlickrPhotoListInteractorInputProtocol? { get set }
    var wireframe : FlickrPhotoListWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func doFlickrImageSearchFor(searchQuery query:String)
    func doMoreFlickrImageSearchFor(searchQuery query:String)
    func updateView()
}

protocol FlickrPhotoListViewProtocol:class {
    var presenter : FlickrPhotoListPresenterProtocol? { get set }
    func showLoading()
    func hideLoading()
    func showError(error: NSError)
    func updateView(photoList:[FlickrPhoto])
}

protocol FlickrPhotoListInteractorInputProtocol:class {
    var interactor: FlickrPhotoListInteractorOutputProtocol? { get set }
    var remoteDataManager : FlickrPhotoListRemoteDataManagerInputProtocol? { get set }
    func fetchPhotosForSearchQuery(query:String)
}

protocol FlickrPhotoListInteractorOutputProtocol : class {
    func didFetchPhotos(photoList: [FlickrPhoto])
    func OnError(error:NSError)
}

protocol FlickrPhotoListRemoteDataManagerInputProtocol :class {
    var remoteRequestHandler: FlickrPhotoListRemoteDataManagerOutputProtocol? { get set }
    func fetchPhotosForSearchQuery(query:String)
}

protocol FlickrPhotoListRemoteDataManagerOutputProtocol : class {
    func onPhotoListFetchSucceed(photoList : [FlickrPhoto])
    func onError(error:NSError)
}
