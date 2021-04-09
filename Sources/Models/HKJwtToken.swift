//
//  HKJwtToken.swift
//  Alamofire
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//

import Foundation
import Offenbach

/// An authentication token used to sign API communication
public struct HKJwtToken: TokenProtocol {
    /// The authentication token
    public var token: String?

    public func apply(to api: Hubkit) {
        api.set(jwt: self)
    }
}
