//
//  StringExtension.swift
//  garrigues
//
//  Created by Diego Salcedo on 10/09/22.
//  Copyright © 2022 Seresco. All rights reserved.
//

import Foundation

extension String {
    
    func getWeatherIcon() -> String {
        switch self {
        case "Despejado":
            return "ic_clear"
        case "Poco nuboso":
            return "ic_cloud"
        case "Muy nuboso":
            return "ic_high_cloudy"
        case "Nubes altas":
            return "ic_high_cloudy"
        case "Nuboso con lluvia":
            return "ic_rainy"
        case "Muy nuboso con lluvia":
            return "ic_rainy"
        case "Intervalos nubosos con lluvia":
            return "ic_rainy"
        case "Intervalos nubosos con lluvia escasa":
            return "ic_rainy"
        case "Cubierto con lluvia":
            return "ic_rainy"
        case "Nuboso con lluvia escasa":
            return "ic_rainy"
        case "Muy nuboso con lluvia escasa":
            return "ic_rainy"
        default:
            return "ic_empty"
        }
    }
    
    func csvRows() -> [[String]] {
        var rows : [[String]] = []
        
        let newlineCharacterSet = CharacterSet.newlines
        let importantCharactersSet = CharacterSet(charactersIn: ",\"").union(newlineCharacterSet)
        
        let scanner = Scanner(string: self)
        scanner.charactersToBeSkipped = nil
        
        while !scanner.isAtEnd {
            var insideQuotes = false
            var finishedRow = false
            var columns : [String] = []
            var currentColumn = ""
            while !finishedRow {
                var tempString : NSString? = nil
                if scanner.scanUpToCharacters(from: importantCharactersSet, into: &tempString) {
                    currentColumn.append(tempString! as String)
                }
                
                if scanner.isAtEnd {
                    if currentColumn != "" {
                        columns.append(currentColumn)
                    }
                    finishedRow = true
                } else if scanner.scanCharacters(from: newlineCharacterSet, into: &tempString) {
                    if insideQuotes {
                        // Add line break to column text
                        currentColumn.append(tempString! as String)
                    } else {
                        // End of row
                        if currentColumn != "" {
                            columns.append(currentColumn)
                        }
                        finishedRow = true
                    }
                } else if scanner.scanString("\"", into: nil) {
                    if insideQuotes && scanner.scanString("\"", into: nil) {
                        // Replace double quotes with a single quote in the column string.
                        currentColumn.append("\"")
                    } else {
                        // Start or end of a quoted string.
                        insideQuotes = !insideQuotes
                    }
                } else if scanner.scanString(",", into: nil) {
                    if insideQuotes {
                        currentColumn.append(",")
                    } else {
                        // This is a column separating comma
                        columns.append(currentColumn)
                        currentColumn = ""
                        scanner.scanCharacters(from: CharacterSet.whitespaces, into: nil)
                    }
                }
            }
            if columns.count > 0 {
                rows.append(columns)
            }
        }
        return rows
    }
    
}
