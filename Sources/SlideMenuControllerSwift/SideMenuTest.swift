//
//  SideMenuTest.swift
//  SlideMenuControllerSwift
//
//  Created by Changyeol Seo on 11/7/25.
//

import UIKit
import SwiftUI

class ColoredViewController: UIViewController {
    let color:UIColor
    init(color: UIColor) {
        self.color = color
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.frame = view.bounds
        label.frame.origin = .zero
        label.frame.size.height = 100
        label.textAlignment = .center
        label.text = "Hello, World!"
        label.textColor = .black
        view.addSubview(label)

        view.backgroundColor = color
    }
}



class NavigationViewController : SlideMenuController {
    let a = ColoredViewController(color: .red)
    let b = ColoredViewController(color: .yellow)
    override func viewDidLoad() {
        setMainViewController(self.a)
        setLeftViewController(self.b)
        SlideMenuOptions.contentViewScale = 1
        SlideMenuOptions.rightViewWidth = 280

        super.viewDidLoad()
        
    }

}


extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            // 업데이트 로직 필요 없음
        }
    }

    func toPreview() -> some View {
        Preview(viewController: self)
    }
}


#Preview {
    VStack {
        NavigationViewController().toPreview()
        NavigationViewController().a.toPreview()
        NavigationViewController().b.toPreview()
    }
}

