//
//  AppCoordinator.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 13.03.2023.
//

import Foundation

final class AppCoordinator: Coordinator {
    init() {
        super.init()
    }
    
    func run() {
//        runAuthCoordinator()
        runCustomerMainCoordinator()
    }
    
    private func runAuthCoordinator() {
        let coordinator: AuthCoordinator = .init()
        
        coordinator.completion = { [weak self, weak coordinator] in
            guard let self = self, let coordinator else { return }
            self.removeChild(coordinator)
            self.runCustomerMainCoordinator()
        }
        
        addChild(coordinator)
        coordinator.run()
    }
    
    private func runCustomerMainCoordinator() {
        let coordinator: MainCoordinator = .init()
        
        coordinator.completion = { [weak self, weak coordinator] in
            guard let self = self, let coordinator else { return }
            self.removeChild(coordinator)
        }
        
        addChild(coordinator)
        coordinator.run()
    }
    
    private func runCafeMainCoordinator() {
        
    }
}
