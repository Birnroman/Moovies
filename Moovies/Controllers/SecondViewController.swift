import UIKit

class SecondViewController: UIViewController {
    
    var movies: [Movie] = []
//    var selectedMovie: String? // Свойство для хранения выбранного случайного фильма
    
    
    lazy var randomButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "randomButton"), for: .normal)
        button.setTitle("Случайный \n фильм", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(#colorLiteral(red: 0.462745098, green: 0.8745098039, blue: 0.9294117647, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let background: UIImageView = {
        let backgroundImage = UIImageView(image: UIImage(named: "background"))
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(background)
        view.addSubview(randomButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            randomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    @objc func randomButtonTapped() {
        if let selected = movies.randomElement() {
            let thirdVC = ThirdViewController(movies: movies, selectedMovie: selected)
            thirdVC.nameLabel.text = selected.name
            navigationController?.pushViewController(thirdVC, animated: true)
        }
//        navigationController?.pushViewController(thirdVC, animated: true)
    }
    
//    func randomFilm(thirdVC: ThirdViewController) {
////        let thirdVC = ThirdViewController()
//        if let random = movies.randomElement() {
//            thirdVC.nameLabel.text = random
//            navigationController?.pushViewController(thirdVC, animated: true)
//        }
//    }
    
}
