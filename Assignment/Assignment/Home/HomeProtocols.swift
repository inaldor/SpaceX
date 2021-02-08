import UIKit

protocol HomePresenterInput: AnyObject {
    func viewDidLoad()
    func selectedLaunch(navigationController: UINavigationController, selectedLaunch: Launch)
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
    func routeToDetails(navigationController: UINavigationController, selectedLaunch: Launch)
}
