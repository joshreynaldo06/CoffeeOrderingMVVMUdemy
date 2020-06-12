//
//  Order.swift
//  CoffeeOrderMVVMUdemy
//
//  Created by Josh JR Reynaldo on 12/06/20.
//  Copyright © 2020 Josh JR Reynaldo. All rights reserved.
//

import Foundation

enum CoffeeType: String, Codable {
	case capuccino
	case latte
	case espresso
	case cortado
}

enum CoffeeSize: String, Codable {
	case small
	case medium
	case large
}

struct Order: Codable {
	let name: String
	let email: String
	let type: CoffeeType
	let size: CoffeeSize
}
