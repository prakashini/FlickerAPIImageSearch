//
//  FlickrExtensions.swift
//  FlickrPhotoSearch
//
//  Created by Prakashini Pattabiraman on 16/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation
import UIKit

let flickrImageCache = NSCache<NSString, AnyObject>()

extension UIImageView {

    func loadAsyncImage(url : String) -> Void{
        let imageURL = URL(string: url)
        self.image = nil
        
        if let cachedImg  = flickrImageCache.object(forKey: url as NSString) as? UIImage {
            self.image = cachedImg
            return
        }
        
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: imageURL!) { (data, response, error) in
            if error != nil {
                print("error in image download : \(error!)")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    flickrImageCache.setObject(image, forKey: url as NSString)
                    self.image = image
                }
            }
        }
        task.resume()
    }
}
