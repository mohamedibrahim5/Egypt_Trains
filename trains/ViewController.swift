//
//  ViewController.swift
//  trains
//
//  Created by mohamed ibrahim on 31/07/2022.
//

import UIKit
import DropDown

class ViewController: UIViewController,UISearchBarDelegate {
    var dep : String?
    var arr : String?
    @IBAction func contactUs(_ sender: UIButton) {
        if UserDefaults.standard.string(forKey: "dep") == nil || UserDefaults.standard.string(forKey: "arr") == nil  {
            print("koko")
        } else {
            print("dep is \(UserDefaults.standard.string(forKey: "dep") ?? "") arr is \(UserDefaults.standard.string(forKey: "arr") ?? "")")
        }
        
    }
    var x = 0
    @IBOutlet weak var arrView: UIView!
    @IBOutlet weak var view3: UIView!
    
    @IBAction func arrButton(_ sender: UIButton) {
        dropDown2.show()
        dropDown2.reloadAllComponents()
        searchBar.isHidden = false
        view2.isHidden = false
        x = 2
    }
    @IBOutlet weak var arrText: UILabel!
    @IBOutlet weak var view2: UIView!
    @IBAction func canceling(_ sender: UIButton) {
        view2.isHidden = true
    }
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var depView: UIView!
    @IBAction func depButton(_ sender: UIButton) {
        dropDown.show()
        dropDown.reloadAllComponents()
        searchBar.isHidden = false
        view2.isHidden = false
        x = 1
    }
    @IBOutlet weak var depButton: UIButton!
    @IBOutlet weak var depText: UILabel!
    let dropDown = DropDown()
    let dropDown2 = DropDown()
    var trains = ["belqas","sherbin","mansoura","damnhor","fakos","alexandria","egypt","sedigaber","ismailey","mahla","tanta","portsaid","portfoad","metkhames","banha","dommite","gamsa","kafrelshikeh","helwan","shobra","menof","zagzeg","ayyad","25 janunery","damnhor","cairo","elraml"]
    var trainsFilter : [String] = []
    var trains2 = ["belqas","sherbin","mansoura","damnhor","fakos","alexandria","egypt","sedigaber","ismailey","mahla","tanta","portsaid","portfoad","metkhames","banha","dommite","gamsa","kafrelshikeh","helwan","shobra","menof","zagzeg","ayyad","25 janunery","damnhor","cairo","elraml"]
    var trainsFilter2 : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trains.sort()
        trains2.sort()
        searchBar.delegate = self
        trainsFilter = trains
        trainsFilter2 = trains2
        if UserDefaults.standard.string(forKey: "dep") == nil {
            depText.text = "select a dep"
        } else {
            depText.text = UserDefaults.standard.string(forKey: "dep")
        }
        if UserDefaults.standard.string(forKey: "arr") == nil {
            arrText.text = "select a arr"
        } else {
            arrText.text = UserDefaults.standard.string(forKey: "arr")
        }
        
        
        dropDown.anchorView = view3
        dropDown.dataSource = trainsFilter
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y: -(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        dropDown.selectionAction = { [unowned self] (index:Int , item:String) in
            print("selected item : \(item) at index \(index)")
            self.depText.text = trainsFilter[index]
            searchBar.isHidden = true
            view2.isHidden = true
            dep = trainsFilter[index]
            UserDefaults.standard.set(trainsFilter[index], forKey: "dep")
        }
        dropDown2.anchorView = view3
        dropDown2.dataSource = trainsFilter2
        dropDown2.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown2.topOffset = CGPoint(x: 0, y: -(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown2.direction = .bottom
        dropDown2.selectionAction = { [unowned self] (index:Int , item:String) in
            print("selected item : \(item) at index \(index)")
            self.arrText.text = trainsFilter2[index]
            searchBar.isHidden = true
            view2.isHidden = true
            arr = trainsFilter2[index]
            UserDefaults.standard.set(trainsFilter2[index], forKey: "arr")
        }

        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if x == 1 {
            trainsFilter = searchText.isEmpty ? trains : trains.filter({ (dat) -> Bool in
                dat.range(of: searchText, options: .caseInsensitive) != nil
            })
            print("searchText \(searchText)")
            dropDown.show()
            dropDown.dataSource = trainsFilter
        } else if x == 2 {
            trainsFilter2 = searchText.isEmpty ? trains2 : trains2.filter({ (dat) -> Bool in
                dat.range(of: searchText, options: .caseInsensitive) != nil
            })
            print("searchText \(searchText)")
            dropDown2.show()
            dropDown2.dataSource = trainsFilter2
        }
    }
}

