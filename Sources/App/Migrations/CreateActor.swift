//
//  File.swift
//  
//
//  Created by Roger Lacson on 6/8/20.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateActor: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("actors")
        .id()
        .field("name", .string)
        .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("actors").delete()
    }
    
}
