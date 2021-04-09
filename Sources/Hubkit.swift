//
//  Hubkit.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 24/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Alamofire
import Foundation
import HubkitDataModel
import Offenbach

/// Responsible for requesting the HubKit API
final public class Hubkit: Client {
    public static let shared = Hubkit()

    internal required override init() {
        super.init()

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970

//        #if DEBUG
//                set(config: HubkitEnv(env: .staging, decoder: decoder))
//        #else
                set(config: HubkitEnv(env: .production, decoder: decoder))
//        #endif
    }

    fileprivate(set) var project: HKProject? {
        didSet {
            guard let project = project else {
                print("[HubKit] Got no project > ## KO ##")
                return
            }

            print("[HubKit] Got project > \(project.id)")
        }
    }

    public var devices: [HKDevice] {
        project?.devices ?? []
    }

    /// Define the authentication token use to sign the API call to HubKit
    @discardableResult
    public func set(project: String) -> Self {
        get(action: "projects/\(project)") { [weak self] (result: Result<HKProject, AFError>) in
            if case .success(let project) = result {
                self?.project = project
            }
        }

        return self
    }
}

public final class HubkitEnv: Config {
    public override var baseURL: String {
        switch env {
        case .develop:
            return "http://localhost:8080/api/v1"
        case .staging:
            return "https://staging.app.tibtop-connect.com/api/v1"
        case .production:
            return "https://app.tibtop-connect.com/api/v1"
        }
    }
}

extension ApiEnvironment: CustomStringConvertible {
    public var description: String {
        switch self {
        case .develop:
            return "develop"
        case .staging:
            return "staging"
        case .production:
            return "production"
        }
    }
}
