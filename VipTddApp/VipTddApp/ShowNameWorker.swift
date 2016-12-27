//
//  ShowNameWorker.swift
//  VipTddApp
//
//  Created by Jakub Hutny on 21.12.2016.
//  Copyright (c) 2016 Jakub Hutny. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

class ShowNameWorker
{
  // MARK: - Business Logic
    var isRealName = false
  
    func createMessage(text: String) -> String {
        if containsOnlyLetters(input: text) {
            isRealName = true
            return "So you’re name is " + text
        }
        else {
            isRealName = false
            return "I guess " + text + " is not your name, is it?"
        }
    }
    
    func generateRandomIntegerNumber() -> Int {
        return Int(arc4random_uniform(100))
    }
    
    private func containsOnlyLetters(input: String) -> Bool {
        for char in input.characters {
            if (!(char >= "a" && char <= "z") && !(char >= "A" && char <= "Z") ) {
                return false
            }
        }
        return true
    }
}
