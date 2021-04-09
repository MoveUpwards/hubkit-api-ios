//
//  HKApiKeyToken.swift
//  Alamofire
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//

import Foundation
import Offenbach

/// An authentication token used to sign API communication
public struct HKApiKeyToken: TokenProtocol {
    /// The authentication token
    public var token: String?

    public func apply(to api: Hubkit) {
        api.set(apiKey: self)
    }
}
