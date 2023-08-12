import UIKit

class ViewController: UIViewController {

    // MARK: -Properties
    
    var movies = [Movie]()
//    var watchedMovies: [String: Date] = [:] // Словарь для хранения информации о просмотренных фильмах
    
    let tableView = UITableView()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Добавить новый", for: .normal)
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("К выбору", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    // MARK: -Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        setupViews()
        setupConstrains()
        
        }
    
    func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.2271139026, green: 0.2424737215, blue: 0.2698594034, alpha: 1)
        
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = #colorLiteral(red: 0.2271139026, green: 0.2424737215, blue: 0.2698594034, alpha: 1)
        tableView.separatorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2005702014)
        
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
    
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            
            tableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: 16),
            
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 120),
            addButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func addButtonTapped() {
        let alert = UIAlertController(title: "Новый фильм", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Введите название"
        }
        
        let addAction = UIAlertAction(title: "Добавить", style: .default) { [weak self] _ in
            guard let textField = alert.textFields?.first, let text = textField.text, !text.isEmpty else { return }
            let movie = Movie(name: text)
            self?.movies.append(movie)
            self?.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    @objc func backButtonTapped() {
        let secondVC = SecondViewController()
        secondVC.movies = movies
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func goOnboardingButtonTapped() {
        let onboardingVC = OnboardingViewController()
        navigationController?.pushViewController(onboardingVC, animated: true)
    }
}


// MARK: -Extensions

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 0.2271139026, green: 0.2424737215, blue: 0.2698594034, alpha: 1)
//        cell.textLabel?.textColor = .white
        cell.nameLabel.text = movie.name
        cell.countLabel.text = "Просмотров: \(movie.numberOfViews)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            movies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
