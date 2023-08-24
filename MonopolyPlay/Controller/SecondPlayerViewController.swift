//
//  SecondViewController.swift
//  MonopolyPlay
//
//  Created by Балауса Косжанова on 19.02.2023.
//

import UIKit

class SecondPlayerViewController: UIViewController {
    var player = AllPlayers()
    var text = String()
    lazy private var places: UILabel = {
        let label = UILabel()
        label.text = "Helloy"
        label.tintColor = .blue
        label.numberOfLines = 10
        return label
    }()

    override func viewDidLoad() {
        
        places.text = text
        view.backgroundColor = .white
        view.addSubview(places)
        places.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
            make.width.equalTo(50)
           
        }
        super.viewDidLoad()
    }

}
