//
//  ViewController.swift
//  trains
//
//  Created by mohamed ibrahim on 31/07/2022.
//

import UIKit
import DropDown

class ViewController: UIViewController,UISearchBarDelegate {
    
    
    
    @IBAction func results(_ sender: UIButton) {
        print("result")
    }
    @IBAction func Switch(_ sender: UIButton) {
        print("switch")
        var switchU : String?
        switchU = UserDefaults.standard.string(forKey: "arr")
        var switchUi : String?
        switchUi = UserDefaults.standard.string(forKey: "dep")
        UserDefaults.standard.set(switchU!, forKey: "dep")
        UserDefaults.standard.set(switchUi!, forKey: "arr")
        depText.text = switchU!
        arrText.text = switchUi!
        print(switchU!)
        print(switchUi!)
        
        
    }
    @IBAction func stopsButton(_ sender: UIButton) {
        dropDown4.show()
        dropDown4.reloadAllComponents()
        searchBar.isHidden = false
        view2.isHidden = false
        x = 4
    }
    @IBOutlet weak var stopsLabel: UILabel!
    @IBOutlet weak var stops: UIView!
    @IBOutlet weak var trainClassLabel: UILabel!
    @IBAction func trainClassButton(_ sender: UIButton) {
        dropDown3.show()
        dropDown3.reloadAllComponents()
        searchBar.isHidden = false
        view2.isHidden = false
        x = 3
    }
    @IBOutlet weak var traainClass: UIView!
    var dep : String?
    var arr : String?
    var trainClass :String?
    var stop : String?
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
    let dropDown3 = DropDown()
    let dropDown4 = DropDown()
    var trains = ["belqas","sherbin","mansoura","damnhor","fakos","alexandria","egypt","sedigaber","ismailey","mahla","tanta","portsaid","portfoad","metkhames","banha","dommite","gamsa","kafrelshikeh","helwan","shobra","menof","zagzeg","ayyad","25 janunery","damnhor","cairo","elraml"]
    var trainsFilter : [String] = []
    var trains2 = ["belqas","sherbin","mansoura","damnhor","fakos","alexandria","egypt","sedigaber","ismailey","mahla","tanta","portsaid","portfoad","metkhames","banha","dommite","gamsa","kafrelshikeh","helwan","shobra","menof","zagzeg","ayyad","25 janunery","damnhor","cairo","elraml"]
    var trainsFilter2 : [String] = []
    var trainClasses : [String] = ["All","Sleep","Vip","Air Conditioned","NoN Air Conditioned","Disticet","Improved"]
    var trainClassFilter : [String] = []
    var stopsTrains : [String] = ["Any","Direct","Major Cities","Express","Suburbs"]
    var stopsTrainsFilter : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trains.sort()
        trains2.sort()
        searchBar.delegate = self
        trainsFilter = trains
        trainsFilter2 = trains2
        trainClassFilter = trainClasses
        stopsTrainsFilter = stopsTrains
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
        if UserDefaults.standard.string(forKey: "class") == nil {
            trainClassLabel.text = "select a train class"
        } else {
            trainClassLabel.text = UserDefaults.standard.string(forKey: "class")
        }
        if UserDefaults.standard.string(forKey: "stops") == nil {
            stopsLabel.text = "select a train stops"
        } else {
            stopsLabel.text = UserDefaults.standard.string(forKey: "stops")
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
        
        dropDown3.anchorView = view3
        dropDown3.dataSource = trainClassFilter
        dropDown3.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown3.topOffset = CGPoint(x: 0, y: -(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown3.direction = .bottom
        dropDown3.selectionAction = { [unowned self] (index:Int , item:String) in
            print("selected item : \(item) at index \(index)")
            self.trainClassLabel.text = trainClassFilter[index]
            searchBar.isHidden = true
            view2.isHidden = true
            trainClass = trainClassFilter[index]
            UserDefaults.standard.set(trainClassFilter[index], forKey: "class")
        }
        dropDown4.anchorView = view3
        dropDown4.dataSource = stopsTrainsFilter
        dropDown4.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        dropDown4.topOffset = CGPoint(x: 0, y: -(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown4.direction = .bottom
        dropDown4.selectionAction = { [unowned self] (index:Int , item:String) in
            print("selected item : \(item) at index \(index)")
            self.stopsLabel.text = stopsTrainsFilter[index]
            searchBar.isHidden = true
            view2.isHidden = true
            stop = stopsTrainsFilter[index]
            UserDefaults.standard.set(stopsTrainsFilter[index], forKey: "stops")
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
        } else if x == 3 {
            trainClassFilter = searchText.isEmpty ? trainClasses : trainClasses.filter({ (dat) -> Bool in
                dat.range(of: searchText, options: .caseInsensitive) != nil
            })
            print("searchText \(searchText)")
            dropDown3.show()
            dropDown3.dataSource = trainClassFilter
        } else if x == 4 {
            stopsTrainsFilter = searchText.isEmpty ? stopsTrains : stopsTrains.filter({ (dat) -> Bool in
                dat.range(of: searchText, options: .caseInsensitive) != nil
            })
            print("searchText \(searchText)")
            dropDown4.show()
            dropDown4.dataSource = stopsTrainsFilter
        }
    }
}

