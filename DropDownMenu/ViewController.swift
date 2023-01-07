//
//  ViewController.swift
//  DropDownMenu
//
//  Created by yilmaz on 30.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var button: DropDownMenu = {
        let view = DropDownMenu()
        view.setTitle("Colors", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.listHight = 200
        return view
    }()
    
    lazy var buttonNative: UIButton = {
        let view = UIButton()
        view.setTitle("Colors", for: .normal)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setInitial()
    }
    
    private func setInitial() {
        configureNavbar()
        setupLayout()
        initView()
        
        configureNavBarItems()
        
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
        
        buttonNative.showsMenuAsPrimaryAction = true
        
        /// if you need that in advance ?
        // Adding Menus and Shortcuts to the Menu Bar and User Interface
        // https://developer.apple.com/documentation/uikit/uicommand/adding_menus_and_shortcuts_to_the_menu_bar_and_user_interface
        buttonNative.menu = UIMenu(options: .displayInline, children: [actionShare, actionAdd, actionEdit, actionReport, actionDelete])
    }
    
    @objc func menuAction() {
        print("clicked one of menu items")
    }
    
    private func initView() {
        //Set the drop down menu's options
        button.dropDownOptions = ["Blue", "Green", "Magenta", "White", "Black", "Pink"]
    }
    
    private func setupLayout() {
        //Add Button to the View Controller
        view.addSubview(button)
        view.addSubview(buttonNative)
        
        //button Constraints
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //buttonNative Constraints
        buttonNative.topAnchor.constraint(equalTo: button.bottomAnchor, constant: -140).isActive = true
        buttonNative.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonNative.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buttonNative.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func configureNavbar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: #selector(addTapped))
        navigationController?.navigationBar.tintColor = .darkGray
    }
    
    @objc func addTapped() {
        let vc = SecondScreenView()
        navigationController?.pushViewController(vc, animated: true)
    }
}
