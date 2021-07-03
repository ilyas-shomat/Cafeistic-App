//
//  LoginInteractorTest.swift
//  CafeisticTests
//
//  Created by Ilyas Shomat on 03.07.2021.
//

import XCTest
@testable import Cafeistic

class LoginInteractorTest: XCTestCase {

    var sut: LoginInteractor!
    var networkApiService: MockNetworkApiService!
    var sessionTracker: MockSessionTrackerImpl!
    
    override func setUpWithError() throws {
        networkApiService = MockNetworkApiService()
        sessionTracker = MockSessionTrackerImpl()
        
        sut = LoginInteractor(networkApiService: networkApiService, sessionTracker: sessionTracker)
    }

    override func tearDownWithError() throws {
        sut = nil
        networkApiService = nil
        sessionTracker = nil
    }    

    func testPostWithAuthData() throws {
        sut.postWithAuthData(loginEntityIn: LoginEntityIn(username: "login", password: "password"))
        
        XCTAssertTrue(networkApiService.isCalledLoad, "Not started networkApiService.load()")
        
    }
    
    func testPerformanceExample() throws {
        self.measure {
        }
    }
}
