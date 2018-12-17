//
//  FlickrUtils.swift
//  FlickrPhotoSearch
//
//  Created by Prakashini Pattabiraman on 16/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation

func constructFlickrImageURL(withPhotoObj photo:FlickrPhoto) -> String {
    
    let imageUrl = Constants.FlickerBaseURL().getFlickrImageURL()
    let farmInt : Int = photo.flickrPhotoFarm!
    var farmString : String = String(farmInt)
    var finalImageURL = imageUrl.replacingOccurrences(of: "{farm}", with: farmString)
    finalImageURL = finalImageURL.replacingOccurrences(of: "{server}", with: photo.flickrPhotoServer!)
    finalImageURL = finalImageURL.replacingOccurrences(of: "{id}", with: photo.flickrPhotoId!)
    finalImageURL = finalImageURL.replacingOccurrences(of: "{secret}", with: photo.flickrPhotoSecret!)
 
    return finalImageURL
}
