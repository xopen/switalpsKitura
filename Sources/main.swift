import Kitura
import HeliumLogger
import Foundation

HeliumLogger.use()

import Kitura

// Create a new router
let router = Router()

// Handle HTTP GET requests to /
router.get("/") {
    request, response, next in
    response.send("Hello, World!")
    next()
}

router.post("/create")  { request, response, next in
    guard let parsedBody = request.body else {
        next()
        return
    }
    
    switch(parsedBody) {
    case .json(let jsonBody):
        let title = jsonBody["title"].string
        let body = jsonBody["body"].string
        if title && body {
            response.send("blog created")
        } else {
            response.send("error")
        }
    default:
        break
    }
    next()
}

// Add an HTTP server and connect it to the router
let port = Int(ProcessInfo.processInfo.environment["PORT"] ?? "8090") ?? 8090
Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()

// Start the Kitura runloop (this call never returns)
Kitura.run()
