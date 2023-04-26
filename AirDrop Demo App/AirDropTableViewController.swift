//
//  AirDropTableViewController.swift
//  AirDrop Demo App
//
//  Created by Sorfian on 05/04/23.
//

import UIKit

class AirDropTableViewController: UITableViewController {
    
    let filenames = [
        "become ios developer.pdf",
        "hello world.html",
        "cafeloisl.jpg",
        "hello sorfian.ppt",
        "my macbook.png",
        "app requirement example.doc"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filenames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemcell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = filenames[indexPath.row]
        cell.imageView?.image = UIImage(named: "icon\(indexPath.row)");

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "showFileDetail" {
            let destinationController = segue.destination as! DetailViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationController.filename = filenames[indexPath.row]
            }
        }
    }

}
