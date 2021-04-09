//
//  HKRawDataRoutes.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 25/09/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Alamofire
import HubkitDataModel
import Foundation

extension HKRawData {
    /// Create a new session raw data
    @discardableResult
    public static func create(in session: HKSession,
                              _ device: HKDevice,
                              _ file: HKMultiPart,
                              progress: @escaping (Double) -> Void,
                              completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        let parameters: Parameters = [
            "session": session.id,
            "device": device.id
        ]
        
        return Hubkit.shared.upload(action: "raw_datas",
                                     parameters: parameters,
                                     files: [file],
                                     progress: progress,
                                     completion: completion)
    }
    
    /// Get the raw data for the given identifier
    @discardableResult
    public static func get(with identifier: String,
                           completion: @escaping (Result<Self, AFError>) -> Void) -> DataRequest? {
        Hubkit.shared.get(action: "raw_datas/\(identifier)", completion: completion)
    }
}
