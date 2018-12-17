//
//  FlickerPhotoListWireFrame.swift
//  FlickerPhotos
//
//  Created by Prakashini Pattabiraman on 15/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation
import UIKit

class FlickrPhotoListWireFrame : FlickrPhotoListWireFrameProtocol {
    static func createFlickrPhotoListModule() -> UIViewController {
        let flickrVC = mainStoryboard.instantiateViewController(withIdentifier: Constants.FlickrViewConstants.FlickrPhotoListViewStoryboardIdentifier) as! UIViewController
        
        if let viewController = flickrVC as? FlickrPhotoListView {
            let presenter: FlickrPhotoListPresenterProtocol & FlickrPhotoListInteractorOutputProtocol = FlickrPhotoListPresenter()
            let interactor: FlickrPhotoListInteractorInputProtocol & FlickrPhotoListRemoteDataManagerOutputProtocol = FlickrPhotoListInteractor()
            let remoteDataManager: FlickrPhotoListRemoteDataManagerInputProtocol = FlickrPhotoListRemoteDataManager()
            let wireFrame: FlickrPhotoListWireFrameProtocol = FlickrPhotoListWireFrame()
            
            viewController.presenter = presenter
            presenter.view = viewController
            presenter.wireframe = wireFrame
            presenter.interactor = interactor
            interactor.interactor = presenter
            interactor.remoteDataManager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            return flickrVC
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
