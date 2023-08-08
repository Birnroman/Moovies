import UIKit

class OnboardingViewController: UIViewController {
    
    let logoImageView = UIImageView(image: UIImage(named: "logo"))
    let titleLabel = UILabel()
    let firstMovieTextField = UITextField()
    let secondMovieTextField = UITextField()
    let button = UIButton(type: .system)
    let leftView = UIView()
    let rightView = UIView()
    let leftTitle = UILabel()
    let rightTitle = UILabel()
    let leftButton = UIButton(type: .system)
    let rightButton = UIButton(type: .system)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrains()
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    
    func setupViews() {
        
        // устанавливаем фоновое изображение
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        // лого
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // заголовок
        titleLabel.text =   """
                                Давай добавим первые 2 фильма в твою кинотеку
                            """
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // первое поле ввода
        firstMovieTextField.borderStyle = .roundedRect
        firstMovieTextField.backgroundColor = #colorLiteral(red: 0.6392156863, green: 0.6392156863, blue: 0.6392156863, alpha: 0.18)
        firstMovieTextField.attributedPlaceholder = NSAttributedString(
            string: "Название фильма",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        )
        firstMovieTextField.textColor = .white
        firstMovieTextField.font = UIFont.systemFont(ofSize: 15)
        firstMovieTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        // второе поле ввода
        secondMovieTextField.borderStyle = .roundedRect
        secondMovieTextField.backgroundColor = #colorLiteral(red: 0.6392156863, green: 0.6392156863, blue: 0.6392156863, alpha: 0.18)
        secondMovieTextField.attributedPlaceholder = NSAttributedString(
            string: "Название фильма",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        )
        secondMovieTextField.textColor = .white
        secondMovieTextField.font = UIFont.systemFont(ofSize: 15)
        secondMovieTextField.translatesAutoresizingMaskIntoConstraints = false
        
        // кнопка
        button.setTitle("Добавить", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.backgroundColor = #colorLiteral(red: 0.5579580069, green: 0.9144749045, blue: 0.9599676728, alpha: 1)
        button.tintColor = #colorLiteral(red: 0.2166481316, green: 0.2689617872, blue: 0.3792768717, alpha: 1)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        // настройки вьюшек
        
        leftView.backgroundColor = #colorLiteral(red: 0.832431376, green: 0.8982813954, blue: 0.912014544, alpha: 0.28)
        leftView.layer.cornerRadius = 16
        leftView.translatesAutoresizingMaskIntoConstraints = false
        rightView.backgroundColor = #colorLiteral(red: 0.832431376, green: 0.8982813954, blue: 0.912014544, alpha: 0.28)
        rightView.layer.cornerRadius = 16
        rightView.translatesAutoresizingMaskIntoConstraints = false
        
        
        // содержимое левой вью
        
        // заголовок
        leftTitle.textAlignment = .center
        leftTitle.textColor = .white
        leftTitle.font = UIFont.boldSystemFont(ofSize: 17)
        leftTitle.numberOfLines = 0
        leftTitle.text =        """
                                Добавить в кинтеку топ-250 Кинопоиска
                                """
        leftTitle.translatesAutoresizingMaskIntoConstraints = false
        
        // кнопка
        leftButton.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        // содержимое правой вью
        
        // заголовок
        rightTitle.textAlignment = .center
        rightTitle.textColor = .white
        rightTitle.font = UIFont.boldSystemFont(ofSize: 17)
        rightTitle.numberOfLines = 0
        rightTitle.text =        """
                                50 случайных фильмов. Положитесь на наш вкус
                                """
        rightTitle.translatesAutoresizingMaskIntoConstraints = false
        
        // кнопка
        rightButton.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
    
        
        
        // добавляем вьюшки на экран
        
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(firstMovieTextField)
        view.addSubview(secondMovieTextField)
        view.addSubview(button)
        view.addSubview(leftView)
        view.addSubview(rightView)
        
        leftView.addSubview(leftTitle)
        leftView.addSubview(leftButton)
        
        rightView.addSubview(rightTitle)
        rightView.addSubview(rightButton)
        
        
    }
    
    func setupConstrains() {
        
        let margins = view.safeAreaLayoutGuide
        
        // констрейнты для лого
        logoImageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 8).isActive                               = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                        = true
        logoImageView.heightAnchor.constraint(equalToConstant: 70).isActive                                                 = true
        
        // констрейнты для заголовка
        titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 64).isActive                         = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28).isActive                             = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28).isActive                          = true
        
        // констрейнты для первого поля ввода
        firstMovieTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24).isActive                   = true
        firstMovieTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28).isActive                    = true
        firstMovieTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28).isActive                 = true
        firstMovieTextField.heightAnchor.constraint(equalToConstant: 40).isActive                                           = true
        
        // констрейнты для второго поля ввода
        secondMovieTextField.topAnchor.constraint(equalTo: firstMovieTextField.bottomAnchor, constant: 8).isActive          = true
        secondMovieTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28).isActive                   = true
        secondMovieTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28).isActive                = true
        secondMovieTextField.heightAnchor.constraint(equalToConstant: 40).isActive                                          = true
        
        // констрейнты для кнопки
        button.topAnchor.constraint(equalTo: secondMovieTextField.bottomAnchor, constant: 8).isActive                       = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28).isActive                                 = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28).isActive                              = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive                                                        = true
        
        // констрейнты для стека
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(leftView)
        stackView.addArrangedSubview(rightView)
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28).isActive = true
        stackView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 40).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        // констрейнты для левой вьюшки
        leftTitle.topAnchor.constraint(equalTo: leftView.topAnchor, constant: 16).isActive = true
        leftTitle.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 16).isActive = true
        leftTitle.trailingAnchor.constraint(equalTo: leftView.trailingAnchor, constant: -16).isActive = true
        

        
        leftButton.topAnchor.constraint(equalTo: leftTitle.bottomAnchor, constant: 24).isActive = true
        leftButton.centerXAnchor.constraint(equalTo: leftView.centerXAnchor).isActive = true
        
        // констрейнты для правой вьюшки
        rightTitle.topAnchor.constraint(equalTo: rightView.topAnchor, constant: 16).isActive = true

        rightTitle.leadingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: 16).isActive = true
        rightTitle.trailingAnchor.constraint(equalTo: rightView.trailingAnchor, constant: -16).isActive = true
        
        rightButton.topAnchor.constraint(equalTo: rightTitle.bottomAnchor, constant: 24).isActive = true
        rightButton.centerXAnchor.constraint(equalTo: rightView.centerXAnchor).isActive = true

    }
    
    // обрабатываем нажатие на кнопку добавления
    @objc func buttonTapped() {
        // получаем значения из текстовых полей
    }
}
