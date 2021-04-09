//
//  HKRawDataRoutes+Combine.swift
//  
//
//  Created by lgriffie on 06/04/2021.
//

#if canImport(Combine)

import Alamofire
import HubkitDataModel
import Combine
import Foundation
import Offenbach

@available(iOS 13.0, *)
extension HKRawData {
    /// Create a new session raw data
    public static func create(in session: HKSession,
                              _ device: HKDevice,
                              _ file: HKMultiPart,
                              progress: @escaping (Double) -> Void) -> AnyPublisher<Self, Error> {
        Future<Self, Error> { promise in
            create(in: session, device, file, progress: progress) { (result: Result<Self, AFError>) in
                promise(result.mapError({ $0 as Error }))
            }
        }.eraseToAnyPublisher()
    }

    /// Get the raw data for the given identifier
    public static func get(with identifier: String) -> AnyPublisher<Self, Error> {
        Future<Self, Error> { promise in
            get(with: identifier) { (result: Result<Self, AFError>) in
                promise(result.mapError({ $0 as Error }))
            }
        }.eraseToAnyPublisher()
    }
}

#endif
