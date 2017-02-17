//
//  DynTableViewController.swift
//  Animation
//
//  Created by Melaniia Hulianovych on 2/17/17.
//  Copyright © 2017 Melaniia Hulianovych. All rights reserved.
//

import UIKit

class DynTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    var myDataSource:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.rowHeight = UITableViewAutomaticDimension;
        myTableView.estimatedRowHeight = 44.0; // set to whatever your "average" cell height is
        myDataSource = ["For every unique set of",
                    "A good hint that you need to use a new reuse identifier is when your cell variant has a different number of subviews, or the subviews are arranged in a distinct fashion.",
                    "For example",
                    "Note that due to differences in intrinsic content size, cells with the same constraints (type) may still have varying heights! Don't confuse fundamentally different layouts (different constraints) with different calculated view frames (solved from identical constraints) due to different sizes of content.",
                    "Generally speaking, the estimate you provide doesn't have to be very accurate -- it is only used to correctly size the scroll indicator in the table view, and the table view does a good job of adjusting the scroll indicator for incorrect estimates as you scroll cells onscreen.",
                    "Only if your row heights have extreme variability (e.g. differ by an order of magnitude) and you notice the scroll indicator jumping"]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myDataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dynCell", for: indexPath) as! MyTableCell

        cell.resizedCell.text = myDataSource[indexPath.row]

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
