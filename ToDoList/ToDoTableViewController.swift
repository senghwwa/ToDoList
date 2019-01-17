//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Seng Hwwa on 14/01/2019.
//  Copyright © 2019 senghwabeh. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
	
	var todos = [ToDo]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.leftBarButtonItem = editButtonItem
		
		if let savedToDos = ToDo.loadToDos() {
			todos = savedToDos
		} else {
			todos = ToDo.loadSampleToDos()
		}
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return todos.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier") else {fatalError("Could not dequeue a cell")}
		let todo = todos[indexPath.row]
		cell.textLabel?.text = todo.title
		return cell
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
			todos.remove(at: indexPath.row)
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
	}
	
	@IBAction func unwindToDoLIst(segue: UIStoryboardSegue) {
		
	}
	
}
