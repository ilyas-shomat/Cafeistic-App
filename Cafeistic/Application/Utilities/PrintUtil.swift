//
//  PrintUtil.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 23.04.2021.
//

import Foundation

func consolePrint(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
    debugPrint("///", items, separator: separator, terminator: terminator)
    #endif
}

func consolePrint(_ item: Any) {
    #if DEBUG
    debugPrint("///", item)
    #endif
}
