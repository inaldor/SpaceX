import UIKit

final class HomeViewController: UIViewController {

    // MARK: Properties
    
    var presenter: HomePresenterInput?
    
    private let tableView = UITableView()
    
    private var launches: [Launch] = []
    
    private var successfulToggle: Bool = false
    
    private var interactor = HomeInteractor()
    
    /// Activity indicator informing the load to the user.
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor.blue
        activityIndicator.hidesWhenStopped = true
        activityIndicator.isHidden = true
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)

        return activityIndicator
    }()
    
    private let refreshControl = UIRefreshControl()

    // MARK: Initializers
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle

    override func viewDidLoad() {
        
        view.backgroundColor = .white
        presenter?.viewDidLoad()
        
        configureTableView()
    
        configureNavBar()
    }

    // MARK: Imperatives
    
    /// Function responsible to setting the table view
    private func configureTableView() {
        
        /// Place the activity indicator on the center of your current screen
        activityIndicator.center = view.center

        /// Start the activity indicator and place it onto your view
        activityIndicator.startAnimating()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 70
        tableView.separatorStyle = .singleLine
        tableView.alwaysBounceVertical = true
        tableView.keyboardDismissMode = .onDrag

        tableView.register(
            HomeTableViewCell.self,
            forCellReuseIdentifier: HomeTableViewCell.nameOfClass
        )

        
        /// Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        
        view.addSubview(tableView)
        view.addSubview(activityIndicator)

        /// Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshLaunchData(_:)), for: .valueChanged)
        
        /// Applying some constraints to the table view
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
    
    /// Function responsible to setting the Navigation Bar
    func configureNavBar() {

        navigationItem.title = "SpaceX Launches"
            
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Successful", style: .plain, target: self, action: #selector(successfulTapped))

    }
    
    /// Function called when the user tap inside the right bar button in the navigation bar
    @objc private func successfulTapped() {
        
        /// Check what is the valeu of the successful toggle
        if successfulToggle {
            
            self.activityIndicator.startAnimating()
            
            successfulToggle = false
            
            refreshLaunchData(self)
            
            navigationItem.rightBarButtonItem?.title = "Successful"
            
        } else {
            
            successfulToggle = true
            
            let successfulLaunches = launches.filter ( { $0.success == true } )
            
            launches = successfulLaunches
            
            tableView.reloadData()
            
            navigationItem.rightBarButtonItem?.title = "All"
        }
        
    }
    
    /// Function responsible for refresh the list of launchs
    @objc private func refreshLaunchData(_ sender: Any) {
        
        let viewController = self
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(
            interactor: interactor,
            view: viewController,
            router: router
        )
        
        interactor.presenter = presenter
        interactor.getListOfLaunches()
        
        self.refreshControl.endRefreshing()
        
    }
}

// MARK: Presenter Output

extension HomeViewController: HomePresenterOutput {

    /// Function responsible to update the list of launchs, this data comes from the API
    func updateListOfLaunches(list: [Launch]) {
        launches = list
        
        if launches.isEmpty {
            
            print("empty list")
            
        } else {
            
            activityIndicator.stopAnimating()
            
        }
        
        tableView.reloadData()
    }
}

// MARK: TableView Methods

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        launches.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let launch = launches[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeTableViewCell.nameOfClass,
            for: indexPath
        ) as! HomeTableViewCell
        
        cell.update(label: launch.name, time: launch.time.description)
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
        presenter?.selectedLaunch(navigationController: navigationController!, selectedLaunch: launches[indexPath.row])

    }
}
