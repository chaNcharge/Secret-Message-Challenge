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
}

let message = readLine()!
print(message)
