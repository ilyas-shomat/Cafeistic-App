//
//  SignInSceneSpec.swift
//  CafeisticTests
//
//  Created by Ilyas Shomat on 07.02.2023.
//

import XCTest

@testable import Cafeistic

final class SignInSceneSpec: XCTestCase {
    var sut: SignInScene!
    var mockInteractor: SignInInteractorMock!
    
    override func setUpWithError() throws {
        mockInteractor = .init()
        sut = .init()
        
        sut.interactor = mockInteractor
    }
    
    override func tearDownWithError() throws {
        mockInteractor = nil
        sut = nil
    }
    
//    MARK: - Test is login and password entered correctly
    func testCorrectLoginAndPassword() {
        // Given
        var correctEntered = false
        
        // When
        correctEntered = sut.checkLoginAndPassword(login: "qwer", password: "qwer")
        
        // Then
        XCTAssertTrue(correctEntered)
    }
    
//    MARK: - Test is login and password entered correctly
    func testIncorrectLoginAndPassword() {
        // Given
        var correctEntered = false
        
        // When
        correctEntered = sut.checkLoginAndPassword(login: "", password: "qwer")
        
        // Then
        XCTAssertFalse(correctEntered)
    }
    
//    MARK: - Test is SignUpButton called and made authorized in Interactor
    func testSignInButtonTap() {
        // Given
        var isAuthorizeCalled = false
        
        // When
        sut.handleViewActions(
            action: .signInButtonTapped(
                loginText: "qwer",
                passwordText: "qwer"
            )
        )
        
        isAuthorizeCalled = mockInteractor.isAuthorizeCalled
        
        // Then
        XCTAssertTrue(isAuthorizeCalled)
    }
    
}
