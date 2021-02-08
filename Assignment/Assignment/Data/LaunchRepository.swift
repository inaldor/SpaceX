import Foundation

// MARK: Protocols

protocol LaunchRepository {
    var launches: [Launch] { get }
    func updateLaunches(completion: @escaping ([Launch]?, APIError?) -> ())
}

final class LaunchRepositoryImpl: LaunchRepository {

    // MARK: Properties
    
    /// Array of type Launch to support the fetching of the launchs
    public var launches: [Launch] = []
    
    // MARK: Imperatives

    /// Function responsible to fetch the launches
    func updateLaunches(completion: @escaping ([Launch]?, APIError?) -> ()) {
        
        
        /// Building the URL for fetching
        let urlString = APIConstants.baseURL
        guard let url = URL(string: urlString) else { return }
        
        /// Calling the URL Session with the given URL
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            /// Checking for errors
            if let error = error {
                
                print(error)
                

                completion(nil, APIError.requestFailed)
                print("Failed to fetch items:", error)
                return

            }
            
            /// Checking the response
            guard let data = data else { return }
            
            do {
                
                /// Trying to decode the response
                let launchListResponse = try JSONDecoder().decode(LaunchListAPIResponse.self, from: data)
                
                print(launchListResponse)
                
                /// Ordering the list by launch date, recents first
                let orderedLaunchList = launchListResponse.reversed()
                
                print(orderedLaunchList)
                
                /// Sweeping each element of the list
                for element in orderedLaunchList {
                   
                    /// Unwrapping the optional element dateUTC + Formatting date
                    if let dateFormatted = DateFormatter.Default.response.date(from: element.dateUTC) {
                        
                        /// Populating the Launch Model
                        self.launches.append(Launch(flightNumber: String(element.flightNumber), name: element.name, time: dateFormatted, success: element.success, rocket: element.rocket, details: element.details, id: element.id))
                        
                    }
                }
                
                DispatchQueue.main.async {

                    completion(self.launches, nil)
                    
                }
            } catch {
                print("Failed to decode:", APIError.parsingFailed)
            }
            }.resume()
    }
}
