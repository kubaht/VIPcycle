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
  func presentSomething(response: ShowName.Something.Response)
}

protocol ShowNamePresenterOutput: class
{
  func displaySomething(viewModel: ShowName.Something.ViewModel)
}

class ShowNamePresenter: ShowNamePresenterInput
{
  weak var output: ShowNamePresenterOutput!
  
  // MARK: - Presentation logic
  
  func presentSomething(response: ShowName.Something.Response)
  {
    // NOTE: Format the response from the Interactor and pass the result back to the View Controller
    
    let viewModel = ShowName.Something.ViewModel()
    output.displaySomething(viewModel: viewModel)
  }
}
