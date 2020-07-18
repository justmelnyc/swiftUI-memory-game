//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Cosmos Liu on 2020-07-18.
//  Copyright © 2020 Cosmos Liu. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
