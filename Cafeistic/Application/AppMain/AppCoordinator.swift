//
//  AppCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 18.08.2022.
//

import Foundation
import UIKit
import Combine

protocol AppCoordinatorDelegate {
    func setAuthFlow()
    func setMainClientFlow()
}

class AppCoordinator: Coordinator {
    override var root: Presentable {
        return router.toPresentable()
    }
    
    init(router: Router) {
        super.init(router: router, navigationType: .newFlow)
        bindDeeplink()
        setRootFlow()
    }
    
    private func setRootFlow() {
        setAuthFlow()
//        setMainFlow()
    }
    
    private func bindDeeplink() {
//        deeplinkSubject
//            .unwrap()
//            .map(AppFlow.init(deeplink:))
//            .unwrap()
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] deeplink in
//                guard let self = self else { return }
////               TODO: handle deeplink links
//
//                self.resetDeeplink()
//
//            }
//            .store(in: &disposeBag)
    }
}

extension AppCoordinator: AppCoordinatorDelegate {
    func setAuthFlow() {
        
    }
    
    func setMainClientFlow() {
    }
    
    func setMainRestaurantsFlow() {
    }
}
