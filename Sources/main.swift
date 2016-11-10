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

router.post("/create") {
    request, response, next in
    print(request)
    response.send("ok")
    next()
}

// Add an HTTP server and connect it to the router
let port = Int(ProcessInfo.processInfo.environment["PORT"] ?? "8090") ?? 8090
Kitura.addHTTPServer(onPort: port, with: router)
Kitura.run()

// Start the Kitura runloop (this call never returns)
Kitura.run()
