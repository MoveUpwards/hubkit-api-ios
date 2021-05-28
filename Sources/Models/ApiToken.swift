//
//  ApiToken.swift
//  Alamofire
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//

import Offenbach

/// An authentication token used to sign API communication
public struct ApiToken: TokenProtocol {
    public var token: String?
}
