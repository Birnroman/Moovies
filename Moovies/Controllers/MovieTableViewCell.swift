import UIKit

class MovieTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .grayTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var watchAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Посмотрю еще", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.tintColor = .accentColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // SetupUI
        
        backgroundColor = #colorLiteral(red: 0.2271139026, green: 0.2424737215, blue: 0.2698594034, alpha: 1)
    
        contentView.addSubview(nameLabel)
        contentView.addSubview(countLabel)
        contentView.addSubview(watchAgainButton)

        
        
        NSLayoutConstraint.activate([
            
            // nameLabel constraints
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            // countLabel constraints
            countLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            countLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            countLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            // watchAgainButton constraints
            watchAgainButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            watchAgainButton.topAnchor.constraint(equalTo: countLabel.topAnchor),
            watchAgainButton.bottomAnchor.constraint(equalTo: countLabel.bottomAnchor)
        ])
        
        // Доп настройки: шрифты и т.п
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
