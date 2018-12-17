//
//  FlickrPhotoTests.swift
//  FlickrPhotoSearchTests
//
//  Created by LHUser on 17/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import XCTest
import FlickrPhotoSearch

class FlickrPhotoTests: XCTestCase {
    
    var flickrPhoto : FlickrPhoto?

    override func setUp() {
        super.setUp()
        let dictionary:[String : Any] = parseJsonFile()
        let photoArrObj = dictionary["photo"] as? [AnyObject]
        let photoDict : [String : Any] = photoArrObj![0] as! [String : Any]
        self.flickrPhoto = FlickrPhoto.init(photoDict)
    }
    
    func testThatFlickPhotoObjHasAllFields() {
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoId, "31410371817", "There is a mismatch with Json")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoOwner , "136190838@N08", "There is a mismatch with Json")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoSecret , "e71020f9a8", "There is a mismatch with Json")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoServer , "4872", "There is a mismatch with Json")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoFarm , 5, "There is a mismatch with Json")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoTitle , "Eugene MIC_4985.jpg", "There is a mismatch with Json")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoIsfriend , false, "There is a mismatch with Json")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoIsfamily , false, "There is a mismatch with Json")
    }
    
    func testThatFlickPhotoObjHasDefaultValue() {
        
        self.flickrPhoto = FlickrPhoto([:])
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoId, "", "Empty string should be in place as a default value instead of nil")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoOwner , "", "Empty string should be in place as a default value instead of nil")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoSecret , "", "Empty string should be in place as a default value instead of nil")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoServer , "", "Empty string should be in place as a default value instead of nil")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoFarm , 0, "Default value should be in place")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoTitle , "", "Empty string should be in place as a default value instead of nil")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoIsfriend , false, "Default value should be in place")
        
        XCTAssertEqual(self.flickrPhoto?.flickrPhotoIsfamily , false, "Default value should be in place")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.flickrPhoto = nil
    }
    
    fileprivate func parseJsonFile() -> [String : Any] {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "mockJson", ofType: "json") {
            do{
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                if let jsonDict = jsonResult as? [String:AnyObject], let photoObj  = jsonDict["photos"] as? [String : AnyObject] {
                    return photoObj
                }
            }
            catch {
                
            }
        }
        return [:]
    }

}
