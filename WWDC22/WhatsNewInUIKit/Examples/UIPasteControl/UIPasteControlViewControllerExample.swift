//
//  UIPasteControlViewControllerExample.swift
//  WhatsNewInUIKit
//
//  Created by StephenFang on 2022/7/18.
//

import UIKit

final class UIPasteControlViewControllerExample : UIViewController {
    
    fileprivate lazy var label : UILabel = {
        $0.textColor = .label
        $0.textAlignment = .center
        $0.text = "Click 'Paste' to inspect pasteboard"
        return $0
    } (UILabel())
    
    fileprivate lazy var pasteControl: UIPasteControl = {
        let pasteControlConfig = UIPasteControl.Configuration()
        pasteControlConfig.baseBackgroundColor = .systemBlue
        pasteControlConfig.baseForegroundColor = .white
        pasteControlConfig.cornerRadius = 5.0
        pasteControlConfig.displayMode = .iconAndLabel
        
        let pasteControl = UIPasteControl(configuration: pasteControlConfig)
        pasteControl.target = self
        return pasteControl
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(label)
        view.addSubview(pasteControl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Call this method will present the alert
        inspectPasteboard()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.sizeToFit()
        label.frame = CGRect(x: (view.bounds.size.width - label.bounds.width) / 2.0, y: (view.bounds.size.height - label.bounds.height) / 2.0, width: label.bounds.width, height: label.bounds.height)
        
        let pasteControlWidth = 90.0
        let pasteControlHeight = 50.0
        pasteControl.frame = CGRect(x: (view.bounds.size.width - pasteControlWidth) / 2.0, y: 300, width: pasteControlWidth, height: pasteControlHeight)
    }
    
    private func inspectPasteboard() {
        guard UIPasteboard.general.hasStrings else {
            return
        }

        let patterns: Set<PartialKeyPath<UIPasteboard.DetectedValues>> = [
            \.probableWebURL,
            \.probableWebSearch,
            \.number,
            \.links,
        ]
        
        UIPasteboard.general.detectPatterns(for: patterns) { result in
            switch result {
            case .success(let detectedPatterns):
                if detectedPatterns.contains(\.probableWebURL) {
                    DispatchQueue.main.async {
                        self.label.text = "URL: \( UIPasteboard.general.string!)"
                    }
                } else if detectedPatterns.contains(\.probableWebSearch) {
                    DispatchQueue.main.async {
                        self.label.text = "Search: \( UIPasteboard.general.string!)"
                    }
                } else if detectedPatterns.contains(\.links) {
                    DispatchQueue.main.async {
                        self.label.text = "Link: \( UIPasteboard.general.string!)"
                    }
                } else if detectedPatterns.contains(\.number) {
                    DispatchQueue.main.async {
                        self.label.text = "Number: \( UIPasteboard.general.string!)"
                    }
                } else {
                    DispatchQueue.main.async {
                        self.label.text = "Wrong pattern"
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.label.text = error.localizedDescription
                }
            }
        }
    }
    
    // MARK: UIPasteConfigurationSupporting
    
    override func canPaste(_ itemProviders: [NSItemProvider]) -> Bool {
        return true
    }
    
    override func paste(itemProviders: [NSItemProvider]) {
        if let itemProvider = itemProviders.first {
            if itemProvider.canLoadObject(ofClass: NSString.self) {
                itemProvider.loadObject(ofClass: NSString.self) { (text, error) in
                    if text != nil {
                        DispatchQueue.main.async {
                            self.label.text = text as? String
                        }
                    }
                }
            }
        }
    }
}

