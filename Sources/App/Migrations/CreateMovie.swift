//
//  File.swift
//  
//
//  Created by Roger Lacson on 6/3/20.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateMovie: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movies") // table name
        .id()
        .field("title", .string) // column name
        .create()
    }
    
    // undo
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movies").delete() // drop the table 
    }
    
}
