import Foundation

class HomePresenter {

    let interactor: HomeInteractorInput
    let router: HomeRouting
    let view: HomePresenterOutput

    init(
        interactor: HomeInteractorInput,
        view: HomePresenterOutput,
        router: HomeRouting
    ) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
}

extension HomePresenter: HomePresenterInput {

    func viewDidLoad() {
        interactor.getListOfLaunches()
    }

    func selectedLaunch(flightNumber: String) {
        router.routeToDetails(flightNumber: flightNumber)
    }
}

extension HomePresenter: HomeInteractorOutput {

    func getListOfLaunchesSuccess(list: [Launch]) {
        view.updateListOfLaunches(list: list)
    }

    func getListOfLaunchesFailure(error: Error) {
        fatalError("Shits broken yo: \(error)")
    }
}
