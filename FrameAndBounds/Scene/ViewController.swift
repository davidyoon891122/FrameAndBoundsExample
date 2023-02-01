//
//  ViewController.swift
//  FrameAndBounds
//
//  Created by jiwon Yoon on 2023/02/02.
//

import UIKit

class ViewController: UIViewController {
    private lazy var superView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        
        return view
    }()
    
    private lazy var subView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        
        return view
    }()

    private lazy var subImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(subView.bounds)
        print(subImageView.bounds)
        print(subView.frame)
    }
}

private extension ViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        view.addSubview(superView)
        superView.addSubview(subView)
        subView.addSubview(subImageView)
        
        superView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        subView.frame = CGRect(x: 16, y: 60, width: 300, height: 500)
        subImageView.frame = CGRect(x: 60.0, y: 100.0, width: 100.0, height: 200.0)
        
        
        subView.bounds.origin.x = 60
        subView.bounds.origin.y = 50
    }
    
    func configureNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.forward"),
            style: .done,
            target: self,
            action: #selector(didTapNextButton)
        )
    }
    
    
    @objc
    func didTapNextButton() {
        let scrollViewController = ScrollViewController()
        navigationController?.pushViewController(scrollViewController, animated: true)
    }
}

