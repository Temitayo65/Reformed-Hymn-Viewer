//
//  ViewController.swift
//  Hymns
//
//  Created by ADMIN on 29/08/2022.
//

import UIKit
import WebKit

class ViewController: UITableViewController{

    var webView: WKWebView!
    var hymns = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items{
            if item.contains(".pdf"){
                hymns.append(item)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hymns.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hymnidentifier", for: indexPath)
        cell.textLabel?.text = String(hymns[indexPath.row][..<hymns[indexPath.row].firstIndex(of: ".")!]) 
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "WebView") as! WebViewController
        let chosenHymn = hymns[indexPath.row]
        let index = chosenHymn.firstIndex(of: ".")!
        let selectedHymn = String(chosenHymn[..<index])
        vc.selectedHymn = selectedHymn
        navigationController?.pushViewController(vc, animated: true)
    }


}

