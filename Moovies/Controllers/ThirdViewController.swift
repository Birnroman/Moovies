import UIKit
class ThirdViewController: UIViewController {
    
    
    let background: UIImageView = {
        let backgroundImage = UIImageView(image: UIImage(named: "background"))
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    let image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "move_icon"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var isMovieWatched: Bool = false

    var selectedMovie: String?
    var completionHandler: ((String) -> Void)? // Замыкание для передачи выбранного фильма обратно в ViewController
      
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 0.5)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var okButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Окей, смотрю", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.backgroundColor = .accentColor
        button.setTitleColor(.darkTextColor, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var anotherButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Другой случайный", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .transparentGrayColor
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(anotherButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()

        
    }
    
    func setupViews() {
        view.addSubview(background)
        view.addSubview(image)
        view.addSubview(nameLabel)
        view.addSubview(countLabel)
        view.addSubview(okButton)
        view.addSubview(anotherButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            countLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            countLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            countLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        
            
            okButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 48),
            okButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            okButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            okButton.heightAnchor.constraint(equalToConstant: 44),
            
            anotherButton.topAnchor.constraint(equalTo: okButton.bottomAnchor, constant: 8),
            anotherButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            anotherButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            anotherButton.heightAnchor.constraint(equalToConstant: 44)

        ])
    }
    

    
    
    @objc func okButtonTapped() {
            
    }
    
    @objc func anotherButtonTapped() {
        let secondVC = SecondViewController()
//        secondVC.
    }
    
//    private func getAttributedText(for movie: String, with dateString: String) -> NSAttributedString {
//           let attributes: [NSAttributedString.Key: Any] = [
//               .strikethroughStyle: NSUnderlineStyle.single.rawValue, // Перечеркиваем текст
//               .foregroundColor: UIColor.white
//           ]
//           let attributedString = NSAttributedString(string: "\(movie) (Просмотрено \(dateString))", attributes: attributes)
//           return attributedString
//       }
    
    
//    @objc func watchAgainButtonTapped() {
//           isMovieWatched = false
//       }
//
    
}
