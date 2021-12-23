//
//  InputLooper.swift
//  SwiftGame
//
//  Created by Yann Rouzaud on 16/12/2021.
//

import Foundation

final class InputHelper {
    private init() { }
    static let shared = InputHelper()
    
    
    /// This function allows to make a loop on a function. As long as this function has not worked, the action is repeated.
    /// - parameter action : A function that returns an element.
    /// - returns: T
    func loopAction<T>(action: () throws -> T) -> T {
        while true {
            do {
                let chosenElement = try action()
                return chosenElement
            } catch {
                if let error = error as? GameError {
                    print(error.description)
                }
            }
        }
    }
    
    
    /// This function selects an element in an array
    /// - parameter array: [T]
    /// - throws: The index is out of bouds
    /// - returns: T
    func chooseElement<T>(from array: [T]) throws -> T {
        
        guard let indexStringInput = readLine() else {
            throw GameError.failedToReadTerminal
        }
        
        guard let indexInput = Int(indexStringInput) else {
            throw GameError.inputIsNotAnInteger
        }
        
        let elementIndex = indexInput - 1
        
        guard array.indices.contains(elementIndex) else {
            throw GameError.failedToAccessElementDueToIndexOutOfBounds
        }
        
        let selectedElement = array[elementIndex]

        return selectedElement
    }
}
