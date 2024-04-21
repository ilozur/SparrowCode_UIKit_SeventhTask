//
//  ViewController.swift
//  SparrowCode_UIKit_SeventhTask
//
//  Created by Edmond Podlegaev on 21.04.2024.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    let imageHeight: CGFloat = 270

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.frame)
        
        scrollView.contentSize.height = view.frame.height * 2
        scrollView.delegate = self

        return scrollView
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: .init(origin: .zero, size: .init(width: view.frame.width, height: imageHeight)))
        
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if (offset <= .zero) {
            imageView.frame.origin.y = offset
            imageView.frame.size.height = imageHeight - offset
        }
        scrollView.verticalScrollIndicatorInsets.top = imageHeight - offset - view.safeAreaInsets.top
    }
}
