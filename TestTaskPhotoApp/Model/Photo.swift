

import Foundation

struct Photo: Decodable {
    let id: String?
    let urls: Urls?
}

struct Urls: Decodable {
    let regular: String?
}
