//
//  LifeCycleExampleViewController.swift
//  WWDC23
//
//  Created by StephenFang on 2023/7/13.
//

import UIKit


final class LifeCycleExampleViewController: UIViewController {
    
    var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        textField = UITextView(frame: CGRect(x: 20, y: 100, width: view.frame.width - 40, height: view.frame.size.height - 100))
        textField.isEditable = false
        textField.font = .preferredFont(forTextStyle: .body)
        view.addSubview(textField)
        
        printLifecycleName("viewDidLoad")
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        
        printLifecycleName("viewIsAppearing")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        printLifecycleName("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        printLifecycleName("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        printLifecycleName("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        printLifecycleName("viewDidDisappear")
    }
    
    func printLifecycleName(_ name: String) {
        textField.text = (textField.text ?? "") + name + "\n"
        print(name)
    }
}
