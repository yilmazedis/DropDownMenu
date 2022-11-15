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
    }
    
    private func initView() {
        //Set the drop down menu's options
        button.dropDownOptions = ["Blue", "Green", "Magenta", "White", "Black", "Pink"]
    }
    
    private func setupLayout() {
        //Add Button to the View Controller
        self.view.addSubview(button)
        
        //button Constraints
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
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
