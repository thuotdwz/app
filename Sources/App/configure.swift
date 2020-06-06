import Fluent
import FluentSQLiteDriver
import Vapor

import QueuesFluentDriver

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    app.queues.use(.fluent(.sqlite))
    app.migrations.add(JobModelMigrate())

    app.migrations.add(CreateTodo())

    // register routes
    try routes(app)
}