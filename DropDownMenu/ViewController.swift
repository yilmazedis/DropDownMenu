//
//  ViewController.swift
//  DropDownMenu
//
//  Created by yilmaz on 30.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var button = DropDownMenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Configure the button
        button = DropDownMenu()
        button.setTitle("Colors", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.listHight = 200
        
        //Add Button to the View Controller
        self.view.addSubview(button)
        
        //button Constraints
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //Set the drop down menu's options
        button.dropDownOptions = ["Blue", "Green", "Magenta", "White", "Black", "Pink"]
        configureNavbar()
    }
    
    private func configureNavbar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: #selector(addTapped))
        navigationController?.navigationBar.tintColor = .darkGray
    }
    
    @objc func addTapped() {
        let vc = SecondScreenView()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
