//
//  ActivityRoutes.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 25/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Alamofire
import HubkitModel
import Foundation

extension Activity {
    /// Get all activities from HubKit
    @discardableResult
    public static func all(completion: @escaping (Result<[Self], AFError>) -> Void) -> DataRequest? {
        Hubkit.shared.list(action: "activities", completion: completion)
    }

    /// Get the activity for the given identifier
    @discardableResult
    public static func get(with identifier: String,
                           completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        Hubkit.shared.get(action: "activities/\(identifier)", completion: completion)
    }
}
