import UIKit

final class HomeRouter {

    func buildModule(navController: UINavigationController) -> UIViewController {
        let viewController = HomeViewController()
        let interactor = HomeInteractor()
        let presenter = HomePresenter(
            interactor: interactor,
            view: viewController,
            router: self
        )
        viewController.presenter = presenter
        interactor.presenter = presenter
        navController.pushViewController(viewController, animated: true)



        return navController
    }
}

extension HomeRouter: HomeRouting {

    func routeToDetails(flightNumber: String) {}
}
