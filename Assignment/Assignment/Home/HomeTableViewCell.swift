import UIKit

final class HomeTableViewCell: UITableViewCell {

    private let label = UILabel()
    private let time = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .blue
        configureSubview()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureSubview() {
        label.numberOfLines = 0
        time.numberOfLines = 0

        let stackView = UIStackView(arrangedSubviews: [label, time])
        stackView.axis = .horizontal

        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 40),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -40)
        ])
    }

    func update(label: String, time: String) {
        self.label.text = label
        self.time.text = time
    }
}
