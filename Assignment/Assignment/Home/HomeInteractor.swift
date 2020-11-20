import Foundation

class HomeInteractor {
    var presenter: HomeInteractorOutput?
}

extension HomeInteractor: HomeInteractorInput {

    func getListOfLaunches() {
        presenter!.getListOfLaunchesSuccess(list: [
            Launch(flightNumber: "1", name: "Foo", time: .distantPast),
            Launch(flightNumber: "2", name: "Bar", time: Date().advanced(by: 10)),
            Launch(flightNumber: "3", name: "Foobar", time: .distantFuture)
        ])
    }
}
