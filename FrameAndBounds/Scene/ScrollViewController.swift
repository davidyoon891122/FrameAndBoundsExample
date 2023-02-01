//
//  ScrollViewController.swift
//  FrameAndBounds
//
//  Created by jiwon Yoon on 2023/02/02.
//

import UIKit

final class ScrollViewController: UIViewController {
    private lazy var imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private lazy var bigSizeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "helena")
        
    
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

private extension ScrollViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(imageScrollView)
        imageScrollView.addSubview(bigSizeImageView)
        
        NSLayoutConstraint.activate([
            imageScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            imageScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bigSizeImageView.topAnchor.constraint(equalTo: imageScrollView.topAnchor),
            bigSizeImageView.leadingAnchor.constraint(equalTo: imageScrollView.leadingAnchor),
            bigSizeImageView.trailingAnchor.constraint(equalTo: imageScrollView.trailingAnchor),
            bigSizeImageView.bottomAnchor.constraint(equalTo: imageScrollView.bottomAnchor)
        ])
    }
    
    @objc
    func modifyBounds() {
        imageScrollView.bounds.origin.x = 1000.0
        imageScrollView.bounds.origin.y = 1000.0
    }
    
    @objc
    func modifyFrame() {
        imageScrollView.frame.origin.x = 100.0
        imageScrollView.frame.origin.y = 100.0
    }
    
    func configureNavigation() {
        let modifyBoundButton = UIBarButtonItem(title: "Bound", style: .done, target: self, action: #selector(modifyBounds))
        let modifyFrameButton = UIBarButtonItem(title: "Frame", style: .done, target: self, action: #selector(modifyFrame))
        
        navigationItem.rightBarButtonItems = [modifyBoundButton, modifyFrameButton]
    }
}
