

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    func getImages(page: Int, completion: @escaping ([Photo]?) -> ()) {
        networkService.request(page: page) { (data, error) in
            if let error = error {
                print(error)
                completion(nil)
            }
            
            let decode = self.decodeJSON(type: [Photo].self, from: data)
            completion(decode)
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let object = try decoder.decode(type.self, from: data)
            return object
        } catch let error {
            print(error)
            return nil
        }
    }
}
