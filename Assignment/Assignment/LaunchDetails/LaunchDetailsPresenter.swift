//
//  LaunchDetailsPresenter.swift
//  Assignment
//
//  Created by Inaldo Ramos Ribeiro on 06/02/2021.
//

import UIKit

class LaunchDetailsPresenter {

    let interactor: LaunchDetailsInteractorInput
    let router: LaunchDetailsRouting
    let view: LaunchDetailsPresenterOutput

    // MARK: Initializers
    
    init(
        interactor: LaunchDetailsInteractorInput,
        view: LaunchDetailsPresenterOutput,
        router: LaunchDetailsRouting
    ) {
        self.interactor = interactor
        self.view = view
        self.router = router
    }
}

// MARK: - Presenter Input

extension LaunchDetailsPresenter: LaunchDetailsPresenterInput {

    func viewDidLoad() {
     
    }
}

// MARK: - Interactor Output

extension LaunchDetailsPresenter: LaunchDetailsInteractorOutput {

}
