//
//  main.swift
//  Secret Message Challenge
//
//  Created by Ethan Cha on 4/20/18.
//  Copyright © 2018 Ethan Cha. All rights reserved.
//

import Foundation

func mod(_ a: Int, _ n: Int) -> Int {
    // A proper modulo operator
    precondition(n > 0, "modulus must be positive")
    let r = a % n
    return r >= 0 ? r : r + n
}

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
        let range: Range<String.Index> = alphabet.range(of: String(character))! // Set range of indexes 0 through character index
        let position: Int = alphabet.distance(from: alphabet.startIndex, to: range.lowerBound) // Find first occurance of character in alphabet
        var newPosition = 0
        if choice == "encrypt" {
            newPosition = mod((position + key), 26)
        } else if choice == "decrypt" {
            newPosition = mod((position - key), 26)
        }
        let index = alphabet.index(alphabet.startIndex, offsetBy: newPosition)
        let newCharacter = alphabet[index]
        newMessage += String(newCharacter)
    } else {
        newMessage += String(character)
    }
}
print(newMessage)
