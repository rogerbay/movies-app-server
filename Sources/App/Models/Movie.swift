//
//  File.swift
//  
//
//  Created by Roger Lacson on 6/3/20.
//

import Foundation
import Fluent
import Vapor

final class Movie: Model, Content {
    
    static let schema = "movies" // table name 
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "poster")
    var poster: String
    
    @Children(for: \.$movie)
    var reviews: [Review]
    
    @Siblings(through: MovieActor.self, from: \.$movie, to: \.$actor)
    var actors: [Actor]
    
    init() {}
    
    init(id: UUID? = nil, title: String, poster: String) {
        self.id = id
        self.title = title
        self.poster = poster
    }
    
}
