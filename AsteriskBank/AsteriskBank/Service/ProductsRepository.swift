import Foundation
import Alamofire

struct Product: Codable {
    let title: String
    let description: String
    let imageName: String
    let category: String
    
    init(title: String, description: String, imageName: String, category: String) {
        self.title = title
        self.description = description
        self.imageName = imageName
        self.category = category
    }
}

class ProductsRepository: ProductsLoading {
    
    private let url = "https://asterisk-bank-tv-default-rtdb.europe-west1.firebasedatabase.app/products.json"
    
    func load() async -> [Product]? {
        // Automatic String to URL conversion, Swift concurrency support, and automatic retry.
        let response = await AF.request(url, interceptor: .retryPolicy)
                               
            // Automatic Decodable support with background parsing.
            .serializingDecodable([Product?].self)
            // Await the full response with metrics and a parsed body.
            .response
        return response.value?.compactMap {
            $0
        }
    }
}
