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
        
        hymns.sort{first, second in
            var final_string = slice(first, from: " ", to: ".")!
            if final_string.contains(" "){
                final_string = slice(final_string, from: 0, to: " ")!
            }
            var final_string2 = slice(second, from: " ", to: ".")!
            if final_string2.contains(" "){
                final_string2 = slice(final_string2, from: 0, to: " ")!
            }
        
            return Int(final_string)! < Int(final_string2)!
        }
        print(hymns)
        

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

    func slice(_ string: String, from startingIndex: Int, to endIndex: Int) -> String {
        let chosenString = string
        var start = chosenString.startIndex
        if start.hashValue != 0{
            start = chosenString.index(start, offsetBy: startingIndex)
        }
        let end = chosenString.index(start, offsetBy: endIndex)
        return String(chosenString[start...end])
    }
    
    func slice(_ string: String, from startingIndex: Int, to character: Character) -> String? {
        let chosenString = string
        var start = chosenString.startIndex
        if start.hashValue != 0{
            start = chosenString.index(start, offsetBy: startingIndex)
        }
        guard let end = chosenString.firstIndex(of: character)else{ return nil}
        return String(chosenString[start..<end])
    }

    func slice(_ string: String, from character: Character, to secondCharacter: Character) -> String? {
        let chosenString = string
        var start = chosenString.firstIndex(of: character)!
        start = chosenString.index(start, offsetBy: 1)
        guard let end = chosenString.firstIndex(of: secondCharacter)else{ return nil}
        return String(chosenString[start..<end])
    }
}

