//
//  LaunchDetailsRouter.swift
//  Assignment
//
//  Created by Inaldo Ramos Ribeiro on 06/02/2021.
//

import UIKit

final class LaunchDetailsRouter: LaunchDetailsRouting {

    func createLaunchDetailsModule(selectedLaunch: Launch) -> UIViewController {
        
        let viewController = LaunchDetailsViewController()
        let interactor = LaunchDetailsInteractor()
        let presenter = LaunchDetailsPresenter(
            interactor: interactor,
            view: viewController,
            router: self
        )
        
        viewController.selectedLaunch = selectedLaunch
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        
        return viewController
    }
}
