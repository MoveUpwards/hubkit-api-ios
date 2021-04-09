//
//  HKRawDataRoutes+RxSwift.swift
//  
//
//  Created by lgriffie on 06/04/2021.
//

import Alamofire
import HubkitDataModel
import Foundation
import Offenbach
import RxSwift

extension HKRawData {
    /// Create a new session raw data
    public static func create(in session: HKSession,
                              _ device: HKDevice,
                              _ file: HKMultiPart,
                              progress: @escaping (Double) -> Void) -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = create(in: session, device, file, progress: progress) { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }

    /// Get the raw data for the given identifier
    public static func get(with identifier: String) -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = get(with: identifier) { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }
}
