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
    
    /// <#Summay text for documentation#>
    /// - parameter <#parameterName#>: <#Description#>.
    /// - throws: <#Errors throwed#>
    /// - returns: <#Return values#>
    func loopAction<T>(action: () throws -> T) -> T {
        while true {
            do {
                let chosenElement = try action()
                return chosenElement
            } catch {
                if let error = error as? Error {
                    print(error.description)
                }
            }
        }
    }
    
    /// <#Summay text for documentation#>
    /// - parameter <#parameterName#>: <#Description#>.
    /// - throws: <#Errors throwed#>
    /// - returns: <#Return values#>
    func chooseElement<T>(from array: [T]) throws -> T {
        
        guard let indexStringInput = readLine() else {
            throw Error.failedToReadTerminal
        }
        
        guard let indexInput = Int(indexStringInput) else {
            throw Error.inputIsNotAnInteger
        }
        
        let elementIndex = indexInput - 1
        
        guard array.indices.contains(elementIndex) else {
            throw Error.failedToAccessElementDueToIndexOutOfBounds
        }
        
        let selectedElement = array[elementIndex]

        return selectedElement
    }
}