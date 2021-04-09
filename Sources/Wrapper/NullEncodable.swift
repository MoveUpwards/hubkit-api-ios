//
//  NullEncodable.swift
//  
//
//  Created by lgriffie on 23/02/2021.
//

import Foundation

@propertyWrapper
struct NullEncodable<T>: Encodable where T: Encodable {

    var wrappedValue: T?

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch wrappedValue {
        case .some(let value): try container.encode(value)
        case .none: try container.encodeNil()
        }
    }
}
