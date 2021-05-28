//
//  AccountRoutes+Model.swift
//  
//
//  Created by lgriffie on 06/04/2021.
//

import Foundation
import Offenbach

extension ApiToken {
    public struct LoginForm: Encodable {
        let username: String
        let password: String

        enum CodingKeys: String, CodingKey {
            case username = "_username"
            case password = "_password"
        }

        public init(username: String, password: String) {
            self.username = username
            self.password = password
        }
    }
}
