//
//  FlickerPhotoListView.swift
//  FlickerPhotos
//
//  Created by Prakashini Pattabiraman on 15/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation
import UIKit


class FlickrPhotoListView : UIViewController {
    
    var presenter: FlickrPhotoListPresenterProtocol?
    var photoList : [FlickrPhoto]?
    fileprivate var searchQuery : String?
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var flickrPhotoListCollectionView: UICollectionView!
    
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.flickrPhotoListCollectionView.isHidden = false
        self.errorView.isHidden = true
    }

}

extension FlickrPhotoListView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.FlickrViewConstants.FlickrPhotoCellIdentifier, for: indexPath) as! FlickrImageCell
        
        let flickrPhotoObj = photoList?[indexPath.row]
        let flickrImageURL = constructFlickrImageURL(withPhotoObj: flickrPhotoObj!)
        cell.flickrImageView.loadAsyncImage(url: flickrImageURL)
        
        return cell
    }
    
}

extension FlickrPhotoListView : UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchQuery = searchBar.text
        presenter?.doFlickrImageSearchFor(searchQuery: self.searchQuery!)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchQuery = searchBar.text
        UserDefaults.standard.set(self.searchQuery, forKey:"query")
        self.searchBar.resignFirstResponder()
        presenter?.doFlickrImageSearchFor(searchQuery: self.searchQuery!)
    }
}

extension FlickrPhotoListView : FlickrPhotoListViewProtocol {
    //MARK: ----- FlickrPhotoListViewProtocol Methods
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func showError(error: NSError) {
        DispatchQueue.main.async(execute: {
            self.errorView.isHidden = false
        })
        
    }
    
    func updateView(photoList: [FlickrPhoto]) {
        DispatchQueue.main.async(execute: {
            self.photoList = photoList
            self.flickrPhotoListCollectionView.isHidden = false
            self.flickrPhotoListCollectionView?.reloadData()
        })
    }
    
    
}
