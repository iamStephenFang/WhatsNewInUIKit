//
//  NavigationStyleExample.swift
//  WhatsNewInUIKit
//
//  Created by StephenFang on 2022/7/19.
//

import UIKit

final class NavigationStyleExample : UIViewController, UINavigationItemRenameDelegate {
    func navigationItem(_: UINavigationItem, didEndRenamingWith title: String) {
        // Rename document using methods appropriate to the app’s data model
    }
    
    private let document = UIDocument(fileURL: URL(fileURLWithPath: "demo"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.style = .editor
        
//        navigationItem.backAction = UIAction(handler: UIActionHandler)
        
        let properties = UIDocumentProperties(url: document.fileURL)

        if let itemProvider = NSItemProvider(contentsOf: document.fileURL) {
            properties.dragItemsProvider = { _ in
                [UIDragItem(itemProvider: itemProvider)]
            }
            properties.activityViewControllerProvider = {
                UIActivityViewController(activityItems: [itemProvider], applicationActivities: nil)
            }
        }

        navigationItem.documentProperties = properties
        
        navigationItem.renameDelegate = self
    }

}
