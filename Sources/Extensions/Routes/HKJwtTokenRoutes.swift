//
//  HKJwtTokenRoutes.swift
//  Alamofire
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//

import Alamofire
import HubkitDataModel
import Foundation

extension HKJwtToken {
    /// Authenticate a user and get a HKJwtToken
    @discardableResult
    public static func authenticate(with params: LoginForm,
                                    completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        Hubkit.shared.post(action: "login_check",
                               parameters: params,
                               encoder: URLEncodedFormParameterEncoder.default,
                               completion: completion)
    }

    /// Logout the current user being login in with JWT token authentication method
    public static func logout() {
        Hubkit.shared.set(jwt: nil)
    }
}
