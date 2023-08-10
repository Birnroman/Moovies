import UIKit

class MovieTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let isWatchedLabel = UILabel()
    let numberOfWatchLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // SetupUI
        
        backgroundColor = #colorLiteral(red: 0.2271139026, green: 0.2424737215, blue: 0.2698594034, alpha: 1)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        isWatchedLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfWatchLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        addSubview(isWatchedLabel)
        addSubview(numberOfWatchLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            isWatchedLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 28),
            isWatchedLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            isWatchedLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            numberOfWatchLabel.topAnchor.constraint(equalTo: isWatchedLabel.bottomAnchor, constant: 28),
            numberOfWatchLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            numberOfWatchLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            numberOfWatchLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        // Доп настройки: шрифты и т.п
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
