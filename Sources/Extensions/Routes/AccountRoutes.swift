//
//  AccountRoutes.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Alamofire
import HubkitModel
import Foundation

extension Account {
    /// Get the current authenticated user
    @discardableResult
    public static func me(completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        Hubkit.shared.get(action: "me", completion: completion)
    }
}
