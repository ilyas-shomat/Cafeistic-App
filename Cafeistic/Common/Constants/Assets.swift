//
//  Assets.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//

import Foundation
import UIKit

internal enum Assets {
    case appLogo
    case visibilityOnIcon
    case visibilityOffIcon
    case orderCart
    case trash
    case menuTabBar
    case menuUnselectedTabBar
    case currentOrderTabBar
    case currentOrderUnselectedTabBar
    case orderHistoryTabBar
    case orderHistoryUnselectedTabBar
    
    public var image: UIImage? {
        switch self {
        case .appLogo:
            return UIImage(named: "logo")
        case .visibilityOnIcon:
            return UIImage(named: "visibility_on_icon")
        case .visibilityOffIcon:
            return UIImage(named: "visibility_off_icon")
        case .orderCart:
            return UIImage(named: "order_cart")
        case .trash:
            return UIImage(named: "trash")
        case .menuTabBar:
            return UIImage(named: "menu_tab_bar")
        case .menuUnselectedTabBar:
            return UIImage(named: "menu_unselected_tab_bar")
        case .currentOrderTabBar:
            return UIImage(named: "current_order_tab_bar")
        case .currentOrderUnselectedTabBar:
            return UIImage(named: "current_order_unselected_tab_bar")
        case .orderHistoryTabBar:
            return UIImage(named: "order_history_tab_bar")
        case .orderHistoryUnselectedTabBar:
            return UIImage(named: "order_history_unselected_tab_bar")
        }
    }
}
