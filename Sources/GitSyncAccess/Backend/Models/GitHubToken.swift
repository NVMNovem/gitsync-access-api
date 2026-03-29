//
//  GitHubToken.swift
//  gitsync-access-api
//
//  Created by Damian Van de Kauter on 29/03/2026.
//

import Foundation

public struct GitHubToken: Codable {
    
    public let token: String
    public let expiresAt: Date
    
    internal init(
        token: String,
        expiresAt: Date
    ) {
        self.token = token
        self.expiresAt = expiresAt
    }
}

extension GitHubToken: Sendable {}

extension GitHubToken: Hashable {}
