//
//  DefaultValue.swift
//  
//
//  Created by lgriffie on 23/02/2021.
//

import Foundation

@propertyWrapper
struct DefaultValue<T>: Encodable where T: StringProtocol & Encodable {
    private let defaultValue: T
    public var wrappedValue: T?

    public init(wrappedValue: T? = nil, _ defaultValue: T) {
        self.wrappedValue = wrappedValue
        self.defaultValue = defaultValue
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        guard let value = wrappedValue, !value.isEmpty else {
            try container.encode(defaultValue)
            return
        }
        
        try container.encode(wrappedValue)
    }
}
