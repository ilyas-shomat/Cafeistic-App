//
//  JSONUtil.swift
//  CafeisticTests
//
//  Created by Ilyas Shomat on 03.07.2021.
//

import Foundation

final class JsonUtil {

    static func loadClass<T: Decodable>(fromResource resource: String, ofType classType: T.Type) throws -> T? {
        guard let data = JsonUtil.loadData(fromResource: resource) else {
            return nil
        }
        do {
            return try JSONDecoder().decode(classType, from: data)
        } catch {
            return nil
        }
    }

    static func loadData(fromResource resource: String, ofType type: String = "json") -> Data? {
        guard let path = Bundle(for: JsonUtil.self).path(forResource: resource, ofType: type) else {
            return nil
        }
        do {
            return try Data(contentsOf: URL(fileURLWithPath: path))
        } catch {
            return nil
        }
    }
}

