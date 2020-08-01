//
//  File.swift
//  
//
//  Created by Roger Lacson on 6/16/20.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct AddPosterColumnToMovies: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movies")
        .field("poster", .string)
        .update()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("movies")
        .deleteField("poster")
        .delete()
    }
    
}
