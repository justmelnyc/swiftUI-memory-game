//
//  Array+Only.swift
//  Memorize
//
//  Created by Cosmos Liu on 2020-07-18.
//  Copyright © 2020 Cosmos Liu. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
