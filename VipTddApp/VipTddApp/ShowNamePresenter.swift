//
//  ShowNamePresenter.swift
//  VipTddApp
//
//  Created by Jakub Hutny on 21.12.2016.
//  Copyright (c) 2016 Jakub Hutny. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ShowNamePresenterInput
{
    func presentLabelMessage(response: ShowName.DisplayMessage.Response)
}

protocol ShowNamePresenterOutput: class
{
    func displayLabelMessage(viewModel: ShowName.DisplayMessage.ViewModel)
}

class ShowNamePresenter: ShowNamePresenterInput
{
    weak var output: ShowNamePresenterOutput!
  
    // MARK: - Presentation logic
  
    func presentLabelMessage(response: ShowName.DisplayMessage.Response) {
        let message: String
        if response.isRealName {
            message = response.message + " and your number is " + String(response.number)
        }
        else {
            message = response.message + " Since now, I will call you " + String(response.number)
        }
        
        let viewModel = ShowName.DisplayMessage.ViewModel(message: message)
        output.displayLabelMessage(viewModel: viewModel)
    }
}
