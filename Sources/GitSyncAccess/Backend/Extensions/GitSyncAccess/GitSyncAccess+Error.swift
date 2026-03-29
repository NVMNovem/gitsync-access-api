//
//  GitSyncAccess+Error.swift
//  gitsync-access-api
//
//  Created by Damian Van de Kauter on 29/03/2026.
//

import Foundation

extension GitSyncAccess {
    
    enum Error: Swift.Error {
        case badRequest
        case notFound
        case internalServerError
        case undocumented(statusCode: Int)
        
        case invalidUUID(String)
    }
}

extension GitSyncAccess.Error: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .badRequest:
                return "Bad request."
        case .notFound:
                return "Not found."
        case .internalServerError:
                return "Internal server error."
        case .undocumented(let statusCode):
                return "Undocumented error with status code: \(statusCode)."
        case .invalidUUID(let id):
                return "Invalid UUID: \(id)."
        }
    }
}
