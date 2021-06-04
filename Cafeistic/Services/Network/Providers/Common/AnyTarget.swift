//
//  AnyTarget.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 31.05.2021.
//

import Foundation
import Moya

final class AnyTarget: BaseApiProvider {
    
    let target: TargetType
    
    var baseURL: URL {
        return target.baseURL
    }
    
    var path: String {
        return target.path
    }
    
    var task: Task {
        return target.task
    }
    
    var method: Moya.Method {
        return target.method
    }
    
    var headers: [String: String]? {
        return target.headers
    }
    
    init(target: TargetType) {
        self.target = target
    }
}

protocol AnyTargetConvertible {
    var any: AnyTarget { get }
}

extension AnyTargetConvertible where Self: TargetType {
    var any: AnyTarget {
        return AnyTarget(target: self)
    }
}
