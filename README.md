# movies-app-server
Vapor 4 setup


![image of swift paper](https://github.com/rogerbay/image-public/blob/master/swiftUp-png.png)
![image of vapor](https://github.com/rogerbay/image-public/blob/master/vapordroplet.png)


Resources

0. https://docs.vapor.codes/4.0/install/macos/
1. Official Postgres Website: https://www.postgresql.org/
2. Postgres.app: https://postgresapp.com/downloads.html
3. POSTMAN: https://www.postman.com/downloads/


1. Vapor 4 Installation 
https://docs.vapor.codes/4.0/install/macos/

Terminal and printing the Swift's version.

2. swift --version

3. brew install vapor

4. vapor --help

5. vapor new hello -n

Tip
The -n flag gives you a bare bones template by automatically answering no to all questions.

6. cd hello 
7. open Package.swift or open . 
8. Command B - to build
9. Edit scheme (make sure it selected the main folder top) 
10. Run then Tab Option, select Working Directory (for your project folder)
11. Play run the server - Server starting on http://127.0.0.1:8080
12. Open web browser localhost:8080/hello


PostgresSQL Installation
1. https://www.postgresql.org
2. https://postgresapp.com/downloads.html Postgres.app with PostgreSQL 12
3. Upon running PostgresSQL app - double click your username and it will launch a terminal.
4. Type -> CREATE DATABASE YuourDBName;

Fluent ORM Driver -Object Relational Mapper
1. On CREATE DATABASE YOURDBName;
2. Select Y to yes to use Fluent
3. Select 1 for Postgres database then Vapor Terminal will show
4. Type -> cd to your folder directory
5. Type -> Open .  Or Open Package.swift

Adding Fluent package to Existing Vapor Project
1. https://docs.vapor.codes/4.0/fluent/overview/

2. Xcode file - Package.swift content

```swift
import PackageDescription
let package = Package(
    name: "hello-postgres-vapor",
    platforms: [
       .macOS(.v10_15)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-rc"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0-beta"),
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0-beta")
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                .product(name: "Vapor", package: "vapor")
                
```

3. Can also update packages from Xcode -> File menu, Swift Package, Update to Latest Package Versions - to look and update for new rc (release version)


Postico PostgreSQL Client
1. https://eggerapps.at/postico/

Postman networking Tools - an API development for HTTP network
1. Postman.com


Section 7: Performing CRUD Operations (Create Read Update Delete) on PostgreSQL Database

Xcode -> at configure.swift file content
import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(hostname: "localhost", username: "postgres", password: "", database: "moviesdb"), as: .psql)
    
    app.migrations.add(CreateMovie())
    
    // register routes
    try routes(app)
}

￼

