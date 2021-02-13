

import Foundation

class NetworkService {
    
    func request(page: Int, completion: @escaping (Data?, Error?) -> Void) {
        
        let parameters = self.prepareParameters(page: page)
        let url = self.url(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeaders()
        request.httpMethod = "GET"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func prepareHeaders() -> [String: String]? {
        var headers: [String: String] = [:]
        headers["Authorization"] = "Client-ID WYW41gLCgUMUzomMqENl-QELpIM-C-INVUVyv4nJKB8"
        return headers
    }
    
    private func prepareParameters(page: Int) -> [String: String] {
        var paprameters: [String: String] = [:]
        paprameters["page"] = String(page)
        paprameters["per_page"] = String(10)
        return paprameters
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/photos"
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        
        return components.url!
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
