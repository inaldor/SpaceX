import UIKit

final class HomeViewController: UIViewController {

    var presenter: HomePresenterInput?
    private let tableView = UITableView()
    private var launches: [Launch] = []

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        view.backgroundColor = .white
        presenter?.viewDidLoad()
        configureTableView()
    }

    private func configureTableView() {
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

        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

extension HomeViewController: HomePresenterOutput {

    func updateListOfLaunches(list: [Launch]) {
        launches = list
        tableView.reloadData()
    }
}

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
        presenter?.selectedLaunch(flightNumber: launches[indexPath.row].flightNumber)
    }
}
