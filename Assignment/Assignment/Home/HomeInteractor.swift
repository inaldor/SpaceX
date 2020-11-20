import Foundation

class HomeInteractor {
    var presenter: HomeInteractorOutput?
    let repository: LaunchRepository = LaunchRepositoryImpl()
}

extension HomeInteractor: HomeInteractorInput {

    func getListOfLaunches() {
        repository.updateLaunches {
            presenter!.getListOfLaunchesSuccess(list: repository.launches)
        }
    }
}
