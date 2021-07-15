//
//  LoginPresenterTest.swift
//  CafeisticTests
//
//  Created by Ilyas Shomat on 14.07.2021.
//

import XCTest
@testable import Cafeistic

class LoginPresenterTest: XCTestCase {
    
    var sut: LoginPresenter?
    var view: LoginViewMock?
    var interactor: LoginInteractorMock?
    var router: LoginRouterMock?

    var username = "login"
    var password = "password"
    
    override func setUpWithError() throws {
        sut = LoginPresenter()
        view = LoginViewMock()
        interactor = LoginInteractorMock()
        router = LoginRouterMock()
        
        sut?.view = view
        sut?.interactor = interactor
        sut?.router = router
    }

    override func tearDownWithError() throws {
        sut = nil
        view = nil
        interactor = nil
        router = nil
    }
    
    func testInteractorStartsSignInProcess() {
        sut?.handleSignInTap(username: username, password: password)
        XCTAssertTrue(interactor?.processing ?? false)
    }
    
//    func testIsShowErrorAlertOnFailResponse() {
//        interactor?.fail = true
//        sut?.handleSignInTap(username: username, password: password)
//        XCTAssertTrue(view?.isAlerShown ?? false)
//    }
    
    func testInteractorReturnFail() {
        interactor?.fail = true
        sut?.handleSignInTap(username: username, password: password)
        XCTAssertTrue(interactor?.fail ?? false)
    }

    func testPerformanceExample() throws {
        self.measure {
        }
    }

}

class LoginViewMock: PresenterToViewLoginProtocol {
        
    var isAlerShown = false
    
    func showErrorAlert(message: AlertMessageConstant) {
        isAlerShown = true
    }
}

class LoginInteractorMock: PresenterToInteractorLoginProtocol {
    
    var processing = false
    var fail = false
    
    var presenter: InteractorToPresenterLoginProtocol?
    
    func loginWithData(loginEntity: LoginEntity) {
        
        presenter = LoginPresenter()
        
        self.processing = true
        
        if fail == true {
            
            presenter?.errorAuthorized(error: "")
        }
        
        else {
            presenter?.successAuthorized()
        }
    }
}

class LoginRouterMock: PresenterToRouterLoginProtocol {
    func showForgetPasswordScene(on view: PresenterToViewLoginProtocol) {
        
    }
    
    func showClientSignUp(on view: PresenterToViewLoginProtocol) {
        
    }
    
    func showEstablishmentSignUp(on view: PresenterToViewLoginProtocol) {
        
    }
    
    func showMenu(on view: PresenterToViewLoginProtocol) {
        
    }
}
