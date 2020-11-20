import Foundation

protocol HomePresenterInput: AnyObject {
    func viewDidLoad()
    func selectedLaunch(flightNumber: String)
}

protocol HomePresenterOutput: AnyObject {
    func updateListOfLaunches(list: [Launch])
}

protocol HomeInteractorInput: AnyObject {
    func getListOfLaunches()
}

protocol HomeInteractorOutput: AnyObject {
    func getListOfLaunchesSuccess(list: [Launch])
    func getListOfLaunchesFailure(error: Error)
}

protocol HomeRouting: AnyObject {
    func routeToDetails(flightNumber: String)
}
