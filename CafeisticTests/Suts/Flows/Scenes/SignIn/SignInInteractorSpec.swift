//
//  SignInInteractorSpec.swift
//  CafeisticTests
//
//  Created by Ilyas Shomat on 07.02.2023.
//

import XCTest
import Combine

@testable import Cafeistic

final class SignInInteractorSpec: XCTestCase {
    var sut: SignInInteractor!
    var cancellables: Set<AnyCancellable>!
    var mockNetworkService: NetworkServiceMock!
    var mockScene: SignInSceneMock!

    override func setUpWithError() throws {
        cancellables = .init()
        mockNetworkService = .init()
        mockScene = .init()
        
        sut = .init(networkService: mockNetworkService, cancellables: cancellables)
        
        sut.scene = mockScene
    }

    override func tearDownWithError() throws {
        cancellables = nil
        mockNetworkService = nil
        mockScene = nil
        sut = nil
    }

//    MARK: - Test is request made success and got user token
    func testSuccessRequest() throws {
        // Given
        let exp = expectation(description: "testSuccessRequest")
        mockNetworkService.responseEntity = SignInResponseEntity(token: "someToken")
        
        // When
        sut.authorize(entity: .init(username: "", password: ""))
        
        // Then
        DispatchQueue.main.async { [weak self] in
            let isTokenLoaded = self?.mockScene.isTokenLoaded
            XCTAssertTrue(isTokenLoaded!)
            
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 0.2)
    }
    
//    MARK: - Test request got fail
    func testFailureRequest() throws {
        // Given
        let exp = expectation(description: "testSuccessRequest")
        mockNetworkService.isError = true
        
        // When
        sut.authorize(entity: .init(username: "", password: ""))
        
        // Then
        DispatchQueue.main.async { [weak self] in
            let error = self?.sut.networkError
            
            XCTAssertNotNil(error)
            
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 0.2)
    }
}
