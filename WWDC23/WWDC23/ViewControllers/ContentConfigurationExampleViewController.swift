//
//  ContentConfigurationExampleViewController.swift
//  WWDC23
//
//  Created by StephenFang on 2023/7/13.
//

import UIKit


final class ContentConfigurationExampleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        var config = UIContentUnavailableConfiguration.empty()
        config.image = UIImage(systemName: "star.fill")
        config.text = "No Content"
        config.secondaryText = "Your content will appear here"
        
        contentUnavailableConfiguration = config
    }
}
