//
//  GitSyncAccess.swift
//  gitsync-access-api
//
//  Created by Damian Van de Kauter on 29/03/2026.
//

import Foundation
import OpenAPIURLSession

public struct GitSyncAccess {

    private var client: Client
    
    public init() throws {
        let serverURL = try Servers.Server1.url()
        
        self.client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )
    }
    
    public init(serverURL: URL) {
        self.client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )
    }
}

public extension GitSyncAccess {
    
    func createGitHubToken(for installationId: Int64) async throws -> GitHubToken {
        let response = try await client.createGitHubToken(.init(body: .json(.init(installationId: installationId))))
        switch response {
        case .ok(let output):
            let json = try output.body.json
            
            return GitHubToken(token: json.token, expiresAt: json.expiresAt)
        case .badRequest:
            throw Error.badRequest
        case .internalServerError:
            throw Error.internalServerError
        case .undocumented(statusCode: let statusCode, _):
            throw Error.undocumented(statusCode: statusCode)
        }
    }
}
