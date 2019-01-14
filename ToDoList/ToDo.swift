//
//  ToDo.swift
//  ToDoList
//
//  Created by Seng Hwwa on 14/01/2019.
//  Copyright © 2019 senghwabeh. All rights reserved.
//

import Foundation

struct ToDo {
	var title: String
	var isComplete: Bool
	var dueDate: Date
	var notes: String?

	static func loadToDos() -> [ToDo]? {
		return nil
	}
	
	static func loadSampleToDos() -> [ToDo] {
		let todo1 = ToDo(title: "ToDo One", isComplete: false, dueDate: Date(), notes: "Notes 1")
		let todo2 = ToDo(title: "ToDo Two", isComplete: false, dueDate: Date(), notes: "Notes 2")
		let todo3 = ToDo(title: "ToDo Three", isComplete: false, dueDate: Date(), notes: "Notes 3")
		return [todo1, todo2, todo3]
	}
}


