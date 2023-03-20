//
//  AppCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 13.03.2023.
//

import Foundation

final class AppCoordinator: Coordinator {
    init() {
        super.init(completion: {})
        bindDeeplinks()
    }
    
    private func bindDeeplinks() {
//        deeplinkSubject
//            .receive(on: DispatchQueue.main)
//            .sink{ [weak self] (coordinatable, navigationType) in
//                switch coordinatable {
//                case let coordinator as AuthCoordinator:
//                    print("coordinator", coordinator)
//                default: ()
//                }
//
//            }
//            .store(in: &cancellables)
    }
    
    func run() {
//        runAuthCoordinator()
        runCustomerMainCoordinator()
    }
    
    private func runAuthCoordinator() {
        var authCoordinator: AuthCoordinator?
        
        authCoordinator = AuthCoordinator{ [weak self] in
            if let wSelf = self, let coordinator = authCoordinator{
                wSelf.removeChild(coordinator)
                wSelf.runCustomerMainCoordinator()
            }
        }
        
        guard let authCoordinator else { return }
        
        addChild(authCoordinator)
        authCoordinator.run()
    }
    
    private func runCustomerMainCoordinator() {
        var customerMainCoordinator: MainCoordinator?

        customerMainCoordinator = MainCoordinator { [weak self] in
            if let wSelf = self, let coordinator = customerMainCoordinator{
                wSelf.removeChild(coordinator)
            }
        }

        guard let customerMainCoordinator else { return }

        addChild(customerMainCoordinator)
        customerMainCoordinator.run()
    }
    
    private func runCafeMainCoordinator() {
        
    }
}
