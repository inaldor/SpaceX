import Foundation

protocol LaunchRepository {
    var launches: [Launch] { get }
    func updateLaunches(successClosure: () -> Void)
}

final class LaunchRepositoryImpl: LaunchRepository {

    public var launches: [Launch] = []

    func updateLaunches(successClosure: () -> Void) {
        launches.append(Launch(flightNumber: "213", name: "Foo", time: Date().advanced(by: 60)))
        launches.append(Launch(flightNumber: "32", name: "Bar", time: Date().advanced(by: -60)))
        successClosure()
    }
}
