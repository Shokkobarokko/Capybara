import UIKit

final class OnboardingContentViewController: UIViewController {
    
    //MARK: - UI elements
    private let emojiLabel = UILabel()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let actionButton = UIButton(type: .system)
    
    //MARK: - Данные для страницы
    private let emojiText: String
    private let titleText: String
    private let descriptionText: String
    private let buttonTitle: String?
    private let buttonAction: (() -> Void)?
    
    //MARK: - Init
    init(emojiText: String, titleText: String, descriptionText: String, buttonTitle: String?, buttonAction: (() -> Void)? = nil) {
        self.emojiText = emojiText
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.baraBackground
        setupUI()
    }
    
    private func setupUI() {
        emojiLabel.text = emojiText
        emojiLabel.font = UIFont.systemFont(ofSize: 80)
        emojiLabel.textAlignment = .center
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = titleText
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        titleLabel.textColor = UIColor.baraTextPrimary
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.text = descriptionText
        descriptionLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        descriptionLabel.textColor = UIColor.baraTextSecondary
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(emojiLabel)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        
        if let buttonTitle = buttonTitle {
            actionButton.setTitle(buttonTitle, for: .normal)
            actionButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
            actionButton.backgroundColor = UIColor.baraGreen
            actionButton.setTitleColor(.white, for: .normal)
            actionButton.layer.cornerRadius = 12
            actionButton.translatesAutoresizingMaskIntoConstraints = false
            actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            view.addSubview(actionButton)
            
            NSLayoutConstraint.activate([
                actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
                actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
                actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
                actionButton.heightAnchor.constraint(equalToConstant: 52)
            ])
        }

        NSLayoutConstraint.activate([
            // Эмодзи
            emojiLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            emojiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emojiLabel.widthAnchor.constraint(equalToConstant: 120),
            emojiLabel.heightAnchor.constraint(equalToConstant: 120),
            
            // Заголовок
            titleLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Не даём заголовку вылезать за края
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            
            // Описание
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -30),
        ])
    }
    @objc private func buttonTapped() {
        buttonAction?()
    }
}
