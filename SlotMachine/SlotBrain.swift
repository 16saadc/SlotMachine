//
//  SlotBrain.swift
//  SlotMachine
//
//  Created by 16saadc on 3/19/15.
//  Copyright (c) 2015 ChrisSaad. All rights reserved.
//

import Foundation

class SlotBrain {
    
    class func unpackSlotsIntoSlotRows (slots: [[Slot]]) -> [[Slot]] {
        
        var slotRow: [Slot] = []
        var slotRow2: [Slot] = []
        var slotRow3: [Slot] = []
        
        for slotArray in slots {
            for var index = 0; index < slotArray.count; index++ {
                let slot = slotArray[index]
                if index == 0 {
                    slotRow.append(slot)
                }
                else if index == 1 {
                    slotRow2.append(slot)
                }
                else if index == 2 {
                    slotRow3.append(slot)
                }
                else {
                    println("Error")
                }
            }
        }
        var slotsInRows: [[Slot]] = [slotRow, slotRow2, slotRow3]
        
        return slotsInRows
    }
    
    class func computeWinnings (slots: [[Slot]]) -> Int {
        
        var slotsInRows = unpackSlotsIntoSlotRows(slots)
        var winnings = 0
        
        var flushWinCount = 0
        var threeOfAKindWinCount = 0
        var straightWinCount = 0
        
        for slotRow in slotsInRows {
            
            if checkFlush(slotRow) == true {
                println("flush")
                winnings++
                flushWinCount++
            }
            
            if checkThreeInARow(slotRow) == true {
                println("three in a row")
                winnings += 2
                straightWinCount++
            }
            
            if checkThreeOfAKind(slotRow) == true {
                println("three of a kind")
                winnings += 3
                threeOfAKindWinCount++
            }
            
        }
        
        if flushWinCount == 3 {
            println("Royal Flush")
            winnings += 15
        }
        
        if straightWinCount == 3 {
            println("Epic Straight")
            winnings += 100
        }
        
        if threeOfAKindWinCount == 3 {
            println("same cards all around")
            winnings += 50
        }
    
        return winnings
    }
    
    class func checkFlush (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.isRed == true && slot2.isRed && slot3.isRed == true {
            return true
        }
        else if slot1.isRed == false && slot2.isRed == false && slot3.isRed == false {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeInARow (slotRow: [Slot]) -> Bool {
        let slot1 = slotRow[0]
        let slot2 = slotRow[1]
        let slot3 = slotRow[2]
        
        if slot1.value == slot2.value - 1 && slot1.value == slot3.value - 2 {
            return true
        }
        else if slot1.value == slot2.value + 1 && slot1.value == slot3.value + 2 {
            return true
        }
        else {
            return false
        }
    }
    
    class func checkThreeOfAKind (slotRow: [Slot]) -> Bool {
        
        if slotRow[0].value == slotRow[1].value && slotRow[0].value == slotRow[2].value {
            return true
        }
        else {
            return false
        }
    }
    
}
