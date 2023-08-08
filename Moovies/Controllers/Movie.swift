import UIKit
class Movie {
    let name: String
    var isWatched = false
    var numberOfViews = 0
    
    init(name: String, isWatched: Bool = false, numberOfViews: Int = 0) {
        self.name = name
    }
}
