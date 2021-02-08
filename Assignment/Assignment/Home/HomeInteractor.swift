import Foundation

class HomeInteractor {
    var presenter: HomeInteractorOutput?
    let repository: LaunchRepository = LaunchRepositoryImpl()
}

// MARK: - Interactor Input

extension HomeInteractor: HomeInteractorInput {

    /// Function responsible to get the list of all launches
    func getListOfLaunches() {
        repository.updateLaunches {_,_ in
            
            self.presenter!.getListOfLaunchesSuccess(list: self.repository.launches)
        }
    }
}
