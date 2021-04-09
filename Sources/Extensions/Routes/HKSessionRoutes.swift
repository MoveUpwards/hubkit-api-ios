//
//  HKSessionRoutes.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 25/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Alamofire
import HubkitDataModel
import Foundation

extension HKSession {
    /// Create a new session
    @discardableResult
    public static func create(in project: HKProject,
                              _ metas: [String: Any] = [:],
                              _ capturedAt: Date,
                              completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        Hubkit.shared.post(action: "sessions",
                            parameters: project.form(capturedAt: capturedAt),
                            completion: completion)
    }

    /// Get the session for the given identifier
    @discardableResult
    public static func get(with identifier: String,
                           completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        Hubkit.shared.get(action: "sessions/\(identifier)", parameters: [String: String](), completion: completion)
    }

    /// Change a session state to ready
    @discardableResult
    public func ready(completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        Hubkit.shared.patch(action: "sessions/\(id)/ready", parameters: [String: String](), completion: completion)
    }
}
