//
//  HKDeviceRoutes.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 25/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Alamofire
import HubkitDataModel
import Foundation

extension HKDevice {
    /// Create a new session
    @discardableResult
    public func create(completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        Hubkit.shared.post(action: "devices", parameters: form, completion: completion)
    }
    
    /// Get the device for the given identifier
    @discardableResult
    public static func get(with identifier: String,
                           completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        Hubkit.shared.get(action: "devices/\(identifier)", completion: completion)
    }

    /// Activate a device for the given identifier
    @discardableResult
    public func update(_ parameters: [String: String],
                       completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        Hubkit.shared.patch(action: "devices/\(id)", parameters: parameters, completion: completion)
    }

    /// Activate a device for the given identifier
    @discardableResult
    public func activate(completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        Hubkit.shared.patch(action: "devices/\(id)/activate", parameters: [String: String](), completion: completion)
    }
}
