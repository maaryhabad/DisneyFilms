//
//  AddViewController.swift
//  DisneyFilms
//
//  Created by Mariana Beilune Abad on 25/04/22.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var dateField: UITextField!
    var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()
        // Do any additional setup after loading the view.
    }
    
    func setupDatePicker() {
        datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 200))
               datePicker.addTarget(self, action: #selector(self.dateChanged), for: .allEvents)
                datePicker.datePickerMode = .date
        //MARK: date picker só com ano
               dateField.inputView = datePicker
               let doneButton = UIBarButtonItem.init(title: "Done", style: .done, target: self, action: #selector(self.datePickerDone))
               let toolBar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 44))
        toolBar.setItems([UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil), doneButton], animated: true)
               dateField.inputAccessoryView = toolBar
    }
    
    @objc func datePickerDone() {
        dateField.resignFirstResponder()
    }

    @objc func dateChanged() {
        dateField.text = "\(datePicker.date)"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
