//
//  AddViewController.swift
//  DisneyFilms
//
//  Created by Mariana Beilune Abad on 25/04/22.
//

import UIKit

class AddViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var dateField: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage = false
    
    var image: UIImage!
    
    var datePicker: UIDatePicker!

    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()
        setupImageView()
        
        imagePicker.delegate = self
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
    
    func setupImageView() {
        imageView.layer.cornerRadius = 40
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedImageView))
        imageView.addGestureRecognizer(tap)
    }
    
    @objc func tappedImageView() {
        print("apertou o imageview")
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.contentMode = .scaleAspectFit
            imageView.image = pickedImage
            image = pickedImage
            selectedImage = true
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func datePickerDone() {
        dateField.resignFirstResponder()
    }

    @objc func dateChanged() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateField.text = formatter.string(from: datePicker.date)
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        if nameField.text != "" && dateField.text != "" && selectedImage {
            let newFilm = Film(year: dateField.text!, name: nameField.text!, poster: image)
            films.append(newFilm)
            print("novo filme cadastrado com sucesso")
        } else {
            let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    

}
