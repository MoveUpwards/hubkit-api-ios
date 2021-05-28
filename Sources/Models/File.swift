//
//  File.swift
//  HubKit
//
//  Created by Loïc GRIFFIE on 09/10/2018.
//  Copyright © 2018 Loïc GRIFFIE. All rights reserved.
//

import Foundation
import Offenbach

public struct File: FileProtocol {
    /// The file's local url.
    public var url: URL? { documentsDirectoryUrl?.appendingPathComponent("\(filename)") }

    /// The file's data.
    public let data: Data

    /// Name of the file, including extension.
    public let filename: String

    /// Mime type of the file.
    public let mimetype: String

    /// Date of the file.
    public let date: Date

    /// Creates a new `File`.
    ///
    ///     let file = File(data: "hello", filename: "foo.txt", mimetype: "application/octect-stream")
    ///
    /// - parameters:
    ///     - data: The file's contents. Default is empty data.
    ///     - filename: The name of the file including the file extension.
    ///     - mimetype: The mimetype of the file.
    ///     - date: The date of the file. Default is now.

    public init(data: Data = Data(),
                filename: String = UUID().uuidString,
                mimetype: String = "application/octect-stream",
                date: Date = Date()) throws {
        self.data = data
        self.filename = filename
        self.mimetype = mimetype
        self.date = date

        try save()
    }
}

extension File: CustomStringConvertible {
    public var description: String {
        "<File url: \(String(describing: url)) name: \(filename) type: \(mimetype) date: \(date)>"
    }
}
