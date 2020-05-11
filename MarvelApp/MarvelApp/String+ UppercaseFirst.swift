//
//  String+ UppercaseFirst.swift
//  MarvelApp
//
//  Created by Haitham Gado on 1/19/19.
//  Copyright © 2019 Haitham Gado. All rights reserved.
//


import UIKit

/** Extension to String class that add utility method to convert first character of string to uppercase letter*/
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
