//
//  File.swift
//  
//
//  Created by Roger Lacson on 6/8/20.
//

import Foundation
import Vapor
import Fluent

final class MovieActor: Model {
    
    static let schema = "movie_actors"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "movie_id")
    var movie: Movie
    
    @Parent(key: "actor_id")
    var actor: Actor
    
    init() { }
    
    init(movieId: UUID, actorId: UUID) {
        self.$movie.id = movieId
        self.$actor.id = actorId
    }
    
}

