//
//  FlickerAPIResource.swift
//  FlickerPhotos
//
//  Created by Prakashini Pattabiraman on 15/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import Foundation

//https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3e7cc266ae2b0e0d78e279ce8e361736& format=json&nojsoncallback=1&safe_search=1&text=kittens
protocol APIResource : class {

    var requestMethod : String { get }
    var text: String { get }
   // var requestURL: String { get }
}

extension APIResource {
    
    var url : String {
        let baseURL = Constants.FlickerBaseURL().getFlickrPhotoSearchURL()
        let queryParams = getQueryParams()
        let url = baseURL + queryParams
        return url
    }
    
    func getQueryParams() -> String {
        var finalQueryParams : String = ""
        var queryParams : String = ""
        var iteration : Int = 0
        let searchQuery : String = UserDefaults.standard.string(forKey: "query")!
        let page : Int = (UserDefaults.standard.integer(forKey: "page"))
        let params = NSMutableDictionary.init(objects: [Constants.FlickrActionMethodsConstants.FLICKR_PHOTO_SEARCH_VALUE as NSCopying, Constants.FLICKR_API_KEY_VALUE as NSCopying, Constants.FlickrAdditionalParamConstants.FLICKR_RESPONSE_FORMAT_VALUE as NSCopying, Constants.FlickrAdditionalParamConstants.FLICKR_NO_JSON_CALL_BACK_VALUE as NSCopying, Constants.FlickrAdditionalParamConstants.FLICKR_SAFE_SEARCH_KEY as NSCopying, searchQuery as NSCopying, Constants.FlickrAdditionalParamConstants.FLICKR_SEARCH_PER_PAGE_VALUE as NSCopying, page as NSCopying], forKeys: [Constants.FlickrActionMethodsConstants.FLICKR_PHOTO_SEARCH_KEY as NSCopying, Constants.FLICKR_API_KEY_KEY as NSCopying, Constants.FlickrAdditionalParamConstants.FLICKR_RESPONSE_FORMAT_KEY as NSCopying, Constants.FlickrAdditionalParamConstants.FLICKR_NO_JSON_CALL_BACK_KEY as NSCopying, Constants.FlickrAdditionalParamConstants.FLICKR_SAFE_SEARCH_KEY as NSCopying, Constants.FlickrAdditionalParamConstants.FLICKR_SEARCH_TEXT_KEY as NSCopying, Constants.FlickrAdditionalParamConstants.FLICKR_SEARCH_PER_PAGE_KEY as NSCopying, Constants.FlickrAdditionalParamConstants.FLICKR_SEARCH_PAGE_NUMBER_KEY as NSCopying])
        
        for(key, value) in params {
            let KeyStr : String = "\(key)"
            let valueStr: String = "\(value)"
            if(iteration == 0) {
                iteration = iteration + 1
                queryParams = Constants.FlickrAdditionalParamConstants.FLICKR_PARAM_QUESTION_DELIMITER + KeyStr  + Constants.FlickrAdditionalParamConstants.FLICKR_PARAM_EQUALTO_DELIMITER + valueStr
            } else {
                    queryParams = Constants.FlickrAdditionalParamConstants.FLICKR_PARAM_AMPERSAND_DELIMITER + KeyStr  + Constants.FlickrAdditionalParamConstants.FLICKR_PARAM_EQUALTO_DELIMITER + valueStr
            }
            
            finalQueryParams = finalQueryParams + queryParams
        }
        
        return finalQueryParams
    }
}
