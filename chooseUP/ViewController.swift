//
//  ViewController.swift
//  chooseUP
//
//  Created by Kazakov Danil on 09.09.2022.
//

import UIKit

class ViewController: UIViewController {
    var picker: UIPickerView!
    var imageView: UIImageView!
    var label: UILabel!
    
    let universe = ["Marvel","DC"]
    let dcPersons = ["aquaman", "batman", "superman"]
    let marvelPersons = ["spiderman", "venom", "carnage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker = UIPickerView()
        view.addSubview(picker)
        picker.center.x = view.center.x
        picker.center.y = view.center.y + 200
        picker.delegate = self
        picker.dataSource = self
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: view.frame.width - 50, height: view.frame.height / 2 ))
        view.addSubview(imageView)
        imageView.center.x = view.center.x
        imageView.contentMode = .scaleAspectFit
        setImage(name: "Spiderman")
        
        imageView.layer.shadowColor = UIColor.red.cgColor
        imageView.layer.shadowOffset = CGSize(width: 0, height: 1)
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOpacity = 15
        
        label = UILabel(frame: CGRect(x: 0, y: 20, width: view.frame.width, height: 50))
        view.addSubview(label)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28)
        label.text = "Choose your hero!"
    }

    func setImage(name: String) {
        guard let newImage = UIImage(named: name) else { return }
        imageView.image = newImage
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return universe.count
        } else {
            return dcPersons.count > marvelPersons.count ? marvelPersons.count : dcPersons.count
        }
    }
    
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return universe[row]
        } else {
            if pickerView.selectedRow(inComponent: 0) == 0 {
                return marvelPersons[row]
            } else {
               return dcPersons[row]
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            pickerView.reloadComponent(1)
            if picker.selectedRow(inComponent: 0) == 0 {
                setImage(name: marvelPersons[pickerView.selectedRow(inComponent: 1)])
            } else {
                setImage(name: dcPersons[pickerView.selectedRow(inComponent: 1)])
            }
        } else {
            if pickerView.selectedRow(inComponent: 0) == 0 {
                setImage(name: marvelPersons[row])
            } else {
                setImage(name: dcPersons[row])
            }
        }
    }
    
    
}
