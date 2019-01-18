//
//  ToDoDetailTableViewController.swift
//  ToDoList
//
//  Created by Seng Hwwa on 18/01/2019.
//  Copyright © 2019 senghwabeh. All rights reserved.
//

import UIKit

class ToDoDetailTableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePickerView: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var isPickerHidden: Bool = true
	var todo: ToDo?
    
    override func viewDidLoad() {
		super.viewDidLoad()
		if let todo = todo {
		navigationItem.title = "To-Do"
			titleTextField.text = todo.title
			isCompleteButton.isSelected = todo.isComplete
			dueDatePickerView.date = todo.dueDate
			notesTextView.text = todo.notes
		} else {
        dueDatePickerView.date = Date().addingTimeInterval(24 * 60 * 60)
		}
		updateDueDateLabel(date: dueDatePickerView.date)
		updateSaveButtonState()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 3

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1

    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)
        
        switch(indexPath) {
        case [1,0]: //Due date cell
            return isPickerHidden ? normalCellHeight : largeCellHeight
        case [2,0]: //Notes cell
            return largeCellHeight
        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath) {
        case [1,0]:
            isPickerHidden = !isPickerHidden
            dueDateLabel.textColor = isPickerHidden ? .black : tableView.tintColor
            tableView.beginUpdates()
            tableView.endUpdates()
        default:
            break
        }
    }
    

    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
	
	func updateDueDateLabel(date: Date) {
		dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
	}
    
	
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		super.prepare(for: segue, sender: sender)
		
		guard segue.identifier == "saveUnwind" else { return }
		
		let title = titleTextField.text!
		let isComplete = isCompleteButton.isSelected
		let dueDate = dueDatePickerView.date
		let notes = notesTextView.text
		todo = ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
	}


    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
        updateSaveButtonState()
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePickerView.date)
    }
    
    
}
