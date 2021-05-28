//
//  DeviceRoutes+Model.swift
//  
//
//  Created by lgriffie on 06/04/2021.
//

import HubkitModel
import Foundation

extension Device {
    internal struct HKDeviceForm: Encodable {
        let manualMode: Bool

        @DefaultValue("")
        var name: String? = nil

        @DefaultValue("")
        var macAddress: String? = nil

        @DefaultValue("")
        var hardwareVersion: String? = nil

        @DefaultValue("")
        var firmwareVersion: String? = nil

        @DefaultValue("")
        var sensorType: String? = nil

        @NullEncodable
        var battery: Int?

        @NullEncodable
        var latitude: Double?

        @NullEncodable
        var longitude: Double?

        init(name: String? = nil,
             macAddress: String? = nil,
             hardwareVersion: String? = nil,
             firmwareVersion: String? = nil,
             manualMode: Bool = false,
             sensorType: String? = nil,
             battery: Int? = nil,
             latitude: Double? = nil,
             longitude: Double? = nil) {

            self.name = name
            self.macAddress = macAddress
            self.hardwareVersion = hardwareVersion
            self.firmwareVersion = firmwareVersion
            self.manualMode = manualMode
            self.sensorType = sensorType
            self.battery = battery
            self.latitude = latitude
            self.longitude = longitude
        }
    }
    
    internal var form: HKDeviceForm {
        .init(name: name,
              macAddress: macAddress,
              hardwareVersion: hardwareVersion,
              firmwareVersion: firmwareVersion,
              manualMode: manualMode,
              sensorType: sensorType)
    }
}
