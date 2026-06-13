import UIKit

protocol OnboardingPageViewControllerDelegate: AnyObject {
    func onboardingDidFinish()
}

final class OnboardingPageViewController: UIPageViewController {
    
    private var pages: [UIViewController] = []
    private let pageControl = UIPageControl()
    weak var onboardingDelegate: OnboardingPageViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        setupPages()
        setupPageControl()
        if let firsPage = pages.first {
            setViewControllers([firsPage], direction: .forward, animated: true)
        }
    }
    
    private func setupPages() {
        let page1 = OnboardingContentViewController(
            emojiText: "🦫",
            titleText: "BARA",
            descriptionText: "Виртуальный капибара-компаньон, который поможет вам бороться с телефонной зависимостью.",
            buttonTitle: nil
        )
        
        let page2 = OnboardingContentViewController(
            emojiText: "⏱️",
            titleText: "Установите лимиты",
            descriptionText: "Выберите приложения, которые отвлекают, и установите дневной лимит.",
            buttonTitle: nil
        )
        
        let page3 = OnboardingContentViewController(
            emojiText: "❤️",
            titleText: "Заботьтесь о питомце",
            descriptionText: "Превысили лимит? Здоровье капибары упадет. Попросите друга простить вас через ссылку.",
            buttonTitle: "Начать",
            buttonAction: { [weak self ] in self?.requestAccess()}
        )
        pages = [page1, page2, page3]
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.baraTextSecondary.withAlphaComponent(0.5)
        pageControl.currentPageIndicatorTintColor = UIColor.baraGreen
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate(
    [
        pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ]
        )
    }
    
    private func requestAccess() {
        ScreenTimeManager.shared.requestAuthorization { [weak self] (success: Bool) in
            if success {
                self?.onboardingDelegate?.onboardingDidFinish()
            } else {
                let alert = UIAlertController(
                    title: "Ошибка",
                    message: "Не удалось получить доступ. Попробуйте позже.",
                    preferredStyle: .alert
                )
                alert.addAction(
                    UIAlertAction(
                        title: "OK",
                        style: .default
                    )
                )
                self?.present(alert, animated: true)
            }
        }
    }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingPageViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let index = pages.firstIndex(
            of: viewController
        ), index > 0 else { return nil }
        return pages[index - 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let index = pages.firstIndex(
            of: viewController
        ), index < pages.count - 1 else {return nil }
        return pages[index + 1]
    }
}

// MARK: - UIPageViewControllerDelegate
extension OnboardingPageViewController: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        guard let currentVC = viewControllers?.first,
              let index = pages.firstIndex(of: currentVC) else { return }
        pageControl.currentPage = index
    }
}

