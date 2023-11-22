//
//  ViewController.swift
//  uikit_task_08
//
//  Created by Andrei on 22.11.2023.
//

import UIKit

class ViewController: UIViewController {
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        imageView.tintColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = .init(width: view.bounds.width, height: 1200)

        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Avatar"
        navigationController?.navigationBar.prefersLargeTitles = true

        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        configureNavBar()
    }

    private func configureNavBar() {
        guard
            let largeTitleViewClass = NSClassFromString("_UINavigationBarLargeTitleView"),
            let largeTitleView = navigationController?.navigationBar.subviews.first(where: { $0.isKind(of: largeTitleViewClass.self) })
        else {
            return
        }
        
        largeTitleView.addSubview(self.avatarImageView)
        NSLayoutConstraint.activate([
            self.avatarImageView.heightAnchor.constraint(equalToConstant: 36),
            self.avatarImageView.widthAnchor.constraint(equalToConstant: 36),
            self.avatarImageView.bottomAnchor.constraint(equalTo: largeTitleView.bottomAnchor, constant: -8),
            self.avatarImageView.trailingAnchor.constraint(equalTo: largeTitleView.trailingAnchor, constant: -16)
        ])
    }
}

