//
//  Constants.swift
//  FLICKRPhotos
//
//  Created by Prakashini Pattabiraman on 15/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation

//https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3e7cc266ae2b0e0d78e279ce8e361736& format=json&nojsoncallback=1&safe_search=1&text=kittens

//http://farm1.static.flickr.com/578/23451156376_8983a8ebc7.jpg
//http://farm{farm}.static.flickr.com/{server}/{id}_{secret}.jpg

struct Constants {
    
    static let FLICKR_PROTOCOL_HTTPS  = "https://"
    static let FLICKR_API_END_POINT = "api.flickr.com"
    static let FLICKR_API_PATH = "/services/rest/"
    static let FLICKR_API_KEY_KEY = "api_key"
    static let FLICKR_API_KEY_VALUE = "3e7cc266ae2b0e0d78e279ce8e361736"
    
    struct FlickrActionMethodsConstants {
        static let FLICKR_PHOTO_SEARCH_KEY = "method"
        static let FLICKR_PHOTO_SEARCH_VALUE = "flickr.photos.search"
    }
    
    struct FlickrAdditionalParamConstants {
        static let FLICKR_PARAM_QUESTION_DELIMITER = "?"
        static let FLICKR_PARAM_EQUALTO_DELIMITER = "="
        static let FLICKR_PARAM_AMPERSAND_DELIMITER = "&"
        static let FLICKR_RESPONSE_FORMAT_KEY = "format"
        static let FLICKR_RESPONSE_FORMAT_VALUE = "json"
        static let FLICKR_NO_JSON_CALL_BACK_KEY = "nojsoncallback"
        static let FLICKR_NO_JSON_CALL_BACK_VALUE = "1"
        static let FLICKR_SAFE_SEARCH_KEY = "safe_search"
        static let FLICKR_SAFE_SEARCH_VALUE = "1"
        static let FLICKR_SEARCH_TEXT_KEY = "text"
        static let FLICKR_SEARCH_PER_PAGE_KEY = "per_page"
        static let FLICKR_SEARCH_PER_PAGE_VALUE = "21"
    }
    
    struct FlickrImageSearchConstants {
        static let FLICKR_IMAGE_API_PROTOCOL_HTTP = "http://"
        static let FLICKR_IMAGE_API_PARTIAL_END_POINT = "farm{farm}.static.flickr.com"
        static let FLICKR_IMAGE_API_PATH = "/{server}/"
        static let FLICKR_IMAGE_API_IMAGE_NAME = "{id}_{secret}.jpg"
    }
    
    struct FlickrViewConstants {
        static let FlickrPhotoListViewStoryboardIdentifier = "FlickrPhotoListViewStoryboardIdentifier"
        static let FlickrPhotoCellIdentifier = "FlickrPhotoCellIdentifier"
    }
    
    class FlickerBaseURL : NSObject {
        func getFlickrPhotoSearchURL() -> String {
            return Constants.FLICKR_PROTOCOL_HTTPS + Constants.FLICKR_API_END_POINT + Constants.FLICKR_API_PATH
        }
        func getFlickrImageURL() -> String {
            return Constants.FlickrImageSearchConstants.FLICKR_IMAGE_API_PROTOCOL_HTTP + Constants.FlickrImageSearchConstants.FLICKR_IMAGE_API_PARTIAL_END_POINT + Constants.FlickrImageSearchConstants.FLICKR_IMAGE_API_PATH + Constants.FlickrImageSearchConstants.FLICKR_IMAGE_API_IMAGE_NAME
        }
    }
}
