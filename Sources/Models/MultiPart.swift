//
//  HKMultiPartProtocol.swift
//  Hubkit
//
//  Created by Loïc GRIFFIE on 27/09/2019.
//  Copyright © 2019 Move Upwards. All rights reserved.
//

import Foundation
import Offenbach

public struct MultiPart: MultiPartProtocol {
    public let name: String
    public let content: FileProtocol

    public init(name: String, content: FileProtocol) {
        self.name = name
        self.content = content
    }
}
