import Vapor

func routes(_ app: Application) throws {
   
    let moviesController = MoviesController()
    let reviewsController = ReviewsController()
    
    // localhost:8080/movies POST
    app.post("movies", use: moviesController.create)
    
    // localhost:8080/movies GET 
    app.get("movies",use: moviesController.all)
    
    // localhost:8080/movies/:movieId DELETE
    app.delete("movies",":movieId", use: moviesController.delete)
    
    // localhost:8080/reviews POST
    app.post("reviews", use: reviewsController.create)
    
    // localhost:8080/movies/:movieId/reviews
    app.get("movies",":movieId","reviews", use: reviewsController.getByMovieId)
    
    
    
}
