//
//  ViewController.swift
//  DisneyFilms
//
//  Created by Mariana Beilune Abad on 25/04/22.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if films.count > 0 {
            return films.count
        } else {
            return 1
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        if films.count > 0 {
            cell.textLabel?.text = films[indexPath.row].name
        } else {
            cell.textLabel?.text = "Faltou meu pudim!"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if films.count > 0 {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
                vc.selectedImage = films[indexPath.row].poster
                navigationController?.pushViewController(vc, animated: true)
            }
        } else {
            print("Caiu no else")
        }
        
    }
}

