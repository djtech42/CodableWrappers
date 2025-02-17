//
//  DataCoding.swift
//  
//
//  Created by Paul Fechner on 10/16/19.
//  Copyright © 2019 PJ Fechner. All rights reserved.

import Foundation

/// Uses Base64 for deserialization of `Data`
/// Uses Base64 for (de)serailization of `Data`
public typealias OptionalBase64DataStaticCoder = OptionalStaticCoder<Base64DataStaticCoder>
public struct Base64DataStaticCoder: StaticCoder {

    public static func decode(from decoder: Decoder) throws -> Data {

        let stringValue = try String(from: decoder)

        guard let value = Data.init(base64Encoded: stringValue) else {
            throw DecodingError.valueNotFound(self,  DecodingError.Context(codingPath: decoder.codingPath,
                                                                           debugDescription: "Expected \(Data.self) but could not convert \(stringValue) to Data"))
        }
        return value
    }

    public static func encode(value: Data, to encoder: Encoder) throws {
        try value.base64EncodedString().encode(to: encoder)
    }
}
