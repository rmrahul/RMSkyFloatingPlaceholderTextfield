//
//  RMTextfieldView.swift
//  Ouch
//
//  Created by Rahul Mane on 11/09/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit

public class RMTextfieldView: UIView {
    let kCONTENT_XIB_NAME = "RMTextfieldView"
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var placeholder: UILabel!
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self)
        setUpTextfield()
        setUpBorder()
    }
    
    private func setUpTextfield(){
        textfield.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        placeholder.text = textfield.placeholder
    }
    
    private func setUpBorder(){
        borderView.backgroundColor = UIColor.clear
        borderView.layer.borderWidth = 1.0
        borderView.layer.borderColor = UIColor.lightGray.cgColor
        borderView.layer.cornerRadius = 5.0
    }
    
    @objc func textFieldDidChange(textfield : UITextField){
        guard let text = textfield.text,!text.isEmpty else {
            placeholder.isHidden = true
            return
        }
        return placeholder.isHidden = false
    }
}


extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
