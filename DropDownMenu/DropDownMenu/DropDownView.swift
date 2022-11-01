//
//  DropDownView.swift
//  DropDownMenu
//
//  Created by yilmaz on 31.10.2022.
//

import UIKit

class DropDownView: UIView, UITableViewDelegate, UITableViewDataSource  {
    
    var dropDownOptions = [String]()
    
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(UITableViewCell.self, forCellReuseIdentifier: "DropDownViewCell")
        view.backgroundColor = .darkGray
        return view
    }()
    
    var delegate : DropDownMenuDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayouts() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DropDownViewCell", for: indexPath)
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        cell.backgroundColor = .darkGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
