//
//  ShowNameViewController.swift
//  VipTddApp
//
//  Created by Jakub Hutny on 21.12.2016.
//  Copyright (c) 2016 Jakub Hutny. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ShowNameViewControllerInput
{
 
}

protocol ShowNameViewControllerOutput
{
    func createLabelMessage(request: ShowName.DisplayMessage.Request)
}

class ShowNameViewController: UIViewController, ShowNameViewControllerInput
{
    var output: ShowNameViewControllerOutput!
    var router: ShowNameRouter!
  
    @IBOutlet var inputTextField: UITextField!
    @IBOutlet var outputLabel: UILabel!
    
    // MARK: - Object lifecycle
  
    override func awakeFromNib()
    {
        super.awakeFromNib()
        ShowNameConfigurator.sharedInstance.configure(viewController: self)
    }
  
    // MARK: - View lifecycle
  
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
  
  // MARK: - Event handling
    
    @IBAction func inputTextFieldValueChanged(_ sender: UITextField) {
        let request = ShowName.DisplayMessage.Request(text: inputTextField.text!)
        output.createLabelMessage(request: request)
    }
    
  // MARK: - Display logic
  
}
