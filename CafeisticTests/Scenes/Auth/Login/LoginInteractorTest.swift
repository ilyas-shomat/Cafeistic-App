//
//  LoginInteractorTest.swift
//  CafeisticTests
//
//  Created by Ilyas Shomat on 03.07.2021.
//

import XCTest
@testable import Cafeistic

class LoginInteractorTest: XCTestCase {

    var sut: LoginInteractor?
    var presenter: LoginPresenterMock?
    var networkApiService: MockNetworkApiService!
    var sessionTracker: MockSessionTrackerImpl!
    
    override func setUpWithError() throws {
        networkApiService = MockNetworkApiService()
        sessionTracker = MockSessionTrackerImpl()
        presenter = LoginPresenterMock()
        
        sut = LoginInteractor(networkApiService: networkApiService, sessionTracker: sessionTracker)
        
        sut?.presenter = presenter
    }

    override func tearDownWithError() throws {
        sut = nil
        networkApiService = nil
        sessionTracker = nil
    }    

    func testPostWithAuthData() throws {
        sut?.postWithAuthData(loginEntityRequest: LoginEntityRequest(username: "login", password: "password"))

        XCTAssertTrue(networkApiService.isCalledLoad, "Not started networkApiService.load()")
    }
    
    func testGetSuccessResponse() throws {
        networkApiService.isFail = true
        sut?.postWithAuthData(loginEntityRequest: LoginEntityRequest(username: "login", password: "password"))
        XCTAssert(presenter?.isFail ?? false)
    }
    
    func testPerformanceExample() throws {
        self.measure {
        }
    }
}

class LoginPresenterMock: InteractorToPresenterLoginProtocol {
    
    var isFail = false
    
    func successAuthorized() {
        isFail = false
    }
    
    func errorAuthorized(error: String) {
        isFail = true
    }
}
