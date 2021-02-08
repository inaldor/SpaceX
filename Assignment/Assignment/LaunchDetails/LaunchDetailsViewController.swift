//
//  LaunchDetailsViewController.swift
//  Assignment
//
//  Created by Inaldo Ramos Ribeiro on 06/02/2021.
//

import UIKit

final class LaunchDetailsViewController: UIViewController {
    
    // MARK: Properties
    
    var selectedLaunch: Launch?
    
    var presenter: LaunchDetailsPresenterInput?
    
    private var interactor = LaunchDetailsInteractor()
    
    // MARK: Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// The stack view containing labels vertically arranged
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.spacing = 1
        
        return stackView
    }()
    
    /// The hardcoded name of the label  flight number
    let flightNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Flight Number"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        
        return label
    }()
    
    /// The label displaying the flight number
    let flightNumberLabelValue: UILabel = {
        var label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        return label
    }()
    
    /// The hardcoded name of the label name
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        
        return label
    }()
    
    /// The label displaying the name of the launch
    let nameLabelValue: UILabel = {
        var label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        return label
    }()
    
    /// The hardcoded name of the label time
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Time"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        
        return label
    }()
    
    /// The label displaying the time of the launch
    let timeLabelValue: UILabel = {
        var label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        return label
    }()
    
    /// The hardcoded name of the label success
    let successLabel: UILabel = {
        let label = UILabel()
        label.text = "Success"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        
        return label
    }()
    
    /// The label displaying if the lanch was successful or not
    let successLabelValue: UILabel = {
        var label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        return label
    }()
    
    /// The hardcoded name of the label rocket information
    let rocketLabel: UILabel = {
        let label = UILabel()
        label.text = "Rocket Info"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        
        return label
    }()
    
    /// The label displaying the rocket information
    let rocketLabelValue: UILabel = {
        var label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        return label
    }()
    
    /// The hardcoded name of the label details
    let detailsLabel: UILabel = {
        let label = UILabel()
        label.text = "Details"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        
        return label
    }()
    
    /// The label displaying the details of the launch
    let detailsLabelValue: UILabel = {
        var label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 8
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        return label
    }()
    
    /// The hardcoded name of the label ID
    let idLabel: UILabel = {
        let label = UILabel()
        label.text = "Id"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        
        return label
    }()
    
    /// The label displaying the ID of the launch
    let idLabelValue: UILabel = {
        var label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.frame = CGRect(x: 0, y: 0, width: 15, height: 20)
        return label
    }()

    // MARK: Life Cycle
    
    override func viewDidLoad() {

        view.backgroundColor = .white
        presenter?.viewDidLoad()
        
        setLabels()
        
    }
    
    // MARK: Imperatives
    
    private func setLabels() {
        
        /// Filling labels with some data
        flightNumberLabelValue.text = selectedLaunch?.flightNumber
        nameLabelValue.text = selectedLaunch?.name
        timeLabelValue.text = selectedLaunch?.time.description
        
        if selectedLaunch?.success == true {
            
            successLabelValue.text = "Yes"
            
        } else if selectedLaunch?.success == false {
            
            successLabelValue.text = "No"
            
        } else {
            
            successLabelValue.text = "Not informed"
            
        }
        
        rocketLabelValue.text = selectedLaunch?.rocket
        detailsLabelValue.text = selectedLaunch?.details
        idLabelValue.text = selectedLaunch?.id
        
        view.addSubview(verticalStackView)
        
        /// Building a vertical stackview containing all the labels
        verticalStackView.addArrangedSubview(flightNumberLabel)
        verticalStackView.addArrangedSubview(flightNumberLabelValue)
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(nameLabelValue)
        verticalStackView.addArrangedSubview(timeLabel)
        verticalStackView.addArrangedSubview(timeLabelValue)
        verticalStackView.addArrangedSubview(successLabel)
        verticalStackView.addArrangedSubview(successLabelValue)
        verticalStackView.addArrangedSubview(rocketLabel)
        verticalStackView.addArrangedSubview(rocketLabelValue)
        verticalStackView.addArrangedSubview(detailsLabel)
        verticalStackView.addArrangedSubview(detailsLabelValue)
        verticalStackView.addArrangedSubview(idLabel)
        verticalStackView.addArrangedSubview(idLabelValue)
     

        /// Making some constraints
        verticalStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 10).isActive = true
        verticalStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        verticalStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    
    }
    
}

// MARK: - Presenter Output
extension LaunchDetailsViewController: LaunchDetailsPresenterOutput {

}
