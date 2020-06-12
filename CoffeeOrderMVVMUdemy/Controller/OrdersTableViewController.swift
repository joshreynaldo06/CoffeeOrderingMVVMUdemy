//
//  OrdersTableViewController.swift
//  CoffeeOrderMVVMUdemy
//
//  Created by Josh JR Reynaldo on 10/06/20.
//  Copyright © 2020 Josh JR Reynaldo. All rights reserved.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		populateOrders()
	}
	
	private func populateOrders() {
		
		guard let coffeeOrdersURL = URL(string: "https://guarded-retreat-82533.herokuapp.com") else {
			fatalError("Incorrect URL")
		}
		
		let resource = Resource<[Order]>(url: coffeeOrdersURL)
		
		Webservice().load(resource: resource) { result in
			switch result {
			case .success(let orders):
				print(orders)
			case .failure(let error):
				print(error)
			}
		}
		
	}
}
