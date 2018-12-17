//
//  FlickrPhotoParentTest.swift
//  FlickrPhotoSearchTests
//
//  Created by LHUser on 17/12/18.
//  Copyright © 2018 Prakashini Pattabiraman. All rights reserved.
//

import XCTest
import FlickrPhotoSearch

class FlickrPhotoParentTest: XCTestCase {
    
    var flickrPhotoParent : FlickrPhotoParent?

    override func setUp() {
        super.setUp()
        let dictionary:[String : Any] = parseJsonFile()
        self.flickrPhotoParent = FlickrPhotoParent(dictionary)
    }
    
    func testThatFlickPhotoParentObjHasAllFields() {
        XCTAssertEqual(self.flickrPhotoParent?.pageNumber, 2, "There is a mismatch with Json")
        
        XCTAssertEqual(self.flickrPhotoParent?.noOfPages , 7654, "There is a mismatch with Json")
    
    }
    
    func testThatFlickPhotoParentObjHasDefaultValue() {
        
        self.flickrPhotoParent = FlickrPhotoParent([:])
        
        XCTAssertEqual(self.flickrPhotoParent?.pageNumber, 0, "Default value should be in place")
        
        XCTAssertEqual(self.flickrPhotoParent?.pageNumber , 0, "Default value should be in place")
    
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.flickrPhotoParent = nil
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
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
