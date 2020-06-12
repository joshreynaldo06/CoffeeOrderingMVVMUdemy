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
	
	private var orderListViewModel = OrderListViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		populateOrders()
	}
	
	private func populateOrders() {
		
		guard let coffeeOrdersURL = URL(string: "https://guarded-retreat-82533.herokuapp.com") else {
			fatalError("Incorrect URL")
		}
		
		let resource = Resource<[Order]>(url: coffeeOrdersURL)
		
		Webservice().load(resource: resource) { [weak self] result in
			switch result {
				
			case .success(let orders):
				
				self?.orderListViewModel.ordersViewModel = orders.map(OrderViewModel.init)
				self?.tableView.reloadData()
				
			case .failure(let error):
				print(error)
			}
		}
		
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.orderListViewModel.ordersViewModel.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
		
		cell.textLabel?.text = vm.type
		cell.detailTextLabel?.text = vm.size
		
		return cell
	}
}
