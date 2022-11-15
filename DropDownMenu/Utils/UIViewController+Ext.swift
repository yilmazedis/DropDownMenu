//
//  UIViewController+Ext.swift
//  DropDownMenu
//
//  Created by yilmaz on 15.11.2022.
//

import UIKit

extension UIViewController {
    func configureNavBarItems() {
        self.title = "UIMenu Sample"
        setMoreButton()
    }
    
    func setMoreButton() {
        
        // @MainActor class UIAction : UIMenuElement
        let actionShare = UIAction(title: "Share", image: .share) { action in
            print("action share clicked")
        }
        let actionAdd = UIAction(title: "Add", image: .add) { action in
            print("action add clicked")
        }
        let actionEdit = UIAction(title: "Edit", image: .edit) { action in
            print("action edit clicked")
        }
        let actionReport = UIAction(title: "Report", image: .report) { action in
            print("action report clicked")
        }
        let actionDelete = UIAction(title: "Delete", image: .delete) { action in
            print("action delete clicked")
        }
        let menu = UIMenu(title: "", children: [actionShare, actionAdd, actionEdit, actionReport, actionDelete])
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: nil, image: .more, primaryAction: nil, menu: menu)
    }
}
