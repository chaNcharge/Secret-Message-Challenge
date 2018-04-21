//
//  main.swift
//  Secret Message Challenge
//
//  Created by Ethan Cha on 4/20/18.
//  Copyright © 2018 Ethan Cha. All rights reserved.
//

import Foundation

let alphabet = "abcdefghijklmnopqrstuvwxyz"
var newMessage = ""

print("Encrypt or decrypt?")
let choice = readLine()!
if choice == "encrypt" {
    print("Please enter a message to encrypt")
} else if choice == "decrypt" {
    print("Please enter a message to decrypt")
} else {
    enum optionError: Error {
        case ValueError(String)
    }
    throw optionError.ValueError("Invalid option")
}

let message = readLine()!
print("Encryption key")
let key = Int(readLine()!)!
for character in message {
    if alphabet.contains(character) {
        let range: Range<String.Index> = alphabet.range(of: String(character))!
        let position: Int = alphabet.distance(from: alphabet.startIndex, to: range.lowerBound)
        var newPosition = 0
        if choice == "encrypt" {
            newPosition = (position + key) % 26
        } else if choice == "decrypt" {
            newPosition = (position - key) % 26
        }
        let index = alphabet.index(alphabet.startIndex, offsetBy: newPosition)
        let newCharacter = alphabet[index]
        newMessage += String(newCharacter)
    } else {
        newMessage += String(character)
    }
}
print(newMessage)
