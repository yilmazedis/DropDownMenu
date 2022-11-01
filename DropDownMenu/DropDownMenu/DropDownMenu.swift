//
//  DropDownMenu.swift
//  DropDownMenu
//
//  Created by yilmaz on 31.10.2022.
//

import UIKit

protocol DropDownMenuDelegate {
    func dropDownPressed(string : String)
}

class DropDownMenu: UIButton {
    
    var listHight: CGFloat = 150
    
    var dropDownOptions: [String] {
        set { dropView.dropDownOptions = newValue }
        get { dropView.dropDownOptions }
    }
    
    private lazy var dropView: DropDownView = {
       let view = DropDownView()
        
        return view
    }()
    
    private var isOpen = false
    private var dropViewHeight = NSLayoutConstraint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray
        
        dropView.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        guard superview != nil else { return }
        
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        dropView.translatesAutoresizingMaskIntoConstraints = false
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        dropViewHeight = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !isOpen {
            showDropDown()
        } else {
            hideDropDown()
        }
        isOpen.toggle()
    }
    
    private func showDropDown() {
        NSLayoutConstraint.deactivate([self.dropViewHeight])
        
        if self.dropView.tableView.contentSize.height > listHight {
            self.dropViewHeight.constant = listHight
        } else {
            self.dropViewHeight.constant = self.dropView.tableView.contentSize.height
        }
        
        NSLayoutConstraint.activate([self.dropViewHeight])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.layoutIfNeeded()
            self.dropView.center.y += self.dropView.frame.height / 2
        }, completion: nil)
    }
    
    private func hideDropDown() {
        NSLayoutConstraint.deactivate([self.dropViewHeight])
        self.dropViewHeight.constant = 0
        NSLayoutConstraint.activate([self.dropViewHeight])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
}

extension DropDownMenu: DropDownMenuDelegate {
    func dropDownPressed(string: String) {
        self.setTitle(string, for: .normal)
        self.hideDropDown()
    }
}
