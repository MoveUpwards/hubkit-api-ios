//
//  HKJwtToken+RxSwift.swift
//  
//
//  Created by lgriffie on 06/04/2021.
//

import Alamofire
import Foundation
import Offenbach
import RxSwift

extension HKJwtToken {
    /// Authenticate a user and get a HKJwtToken
    public static func authenticate(with params: LoginForm) -> Single<Self> {
        Single<Self>.create(subscribe: { single in
            let request = authenticate(with: params) { (result: Result<Self, AFError>) in
                single(result.mapError({ $0 as Error }))
            }
            return Disposables.create { request?.cancel() }
        })
    }
}
