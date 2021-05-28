//
//  ApiKeyToken.swift
//  Alamofire
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//

import Foundation
import Offenbach

/// An authentication token used to sign API communication
public struct ApiKeyToken: TokenProtocol {
    /// The authentication token
    public var token: String?
}
