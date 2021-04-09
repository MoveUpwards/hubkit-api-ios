//
//  HKProjectRoutes+Model.swift
//  
//
//  Created by lgriffie on 06/04/2021.
//

import HubkitDataModel
import Foundation

extension HKProject {
    internal struct HKProjectForm: Encodable {
        let project: String
        let capturedAt: TimeInterval

        init(project: String, capturedAt: TimeInterval) {
            self.project = project
            self.capturedAt = capturedAt
        }
    }

    internal func form(capturedAt: Date) -> HKProjectForm {
        .init(project: id, capturedAt: capturedAt.timeIntervalSince1970)
    }
}
