//
//  HelloViewController.swift
//  MonopolyPlay
//
//  Created by Балауса Косжанова on 19.02.2023.
//

import UIKit

class HelloViewController: UIViewController {
    lazy private var monopolyTitle: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Monopoly"
        label.numberOfLines = 2
        label.font = UIFont(name: "Copperplate-Bold", size: 40)!
        label.textColor = .black
        label.textAlignment = .center
        
        return label
        
        
    }()
    lazy private var picture: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "picture")
        return imgView
    }()
    lazy private var startGameButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Start the Game!", for: .normal)
        btn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)!
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 5
        return btn
        
    }()
    override func viewDidLoad() {
        view.backgroundColor = .white
        startGameButton.addTarget(self, action: #selector(pressedTheButton), for: .touchUpInside)
        setUpViews()
        setUpConstraints()
        super.viewDidLoad()

      
    }
    @objc
    func pressedTheButton() {
        let nextViewController = MainViewController()
        self.navigationController?.pushViewController(nextViewController, animated:false)
    }

}
extension HelloViewController {
    func setUpViews() {
        view.addSubview(monopolyTitle)
        view.addSubview(picture)
        view.addSubview(startGameButton)
    }
    func setUpConstraints() {
        monopolyTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(80)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        picture.snp.makeConstraints { make in
            make.top.equalTo(monopolyTitle.snp.bottom).offset(40)
            make.leading.equalToSuperview().inset(50)
            make.width.equalTo(300)
            make.height.equalTo(250)
             
            
        }
        startGameButton.snp.makeConstraints {make in
            make.top.equalTo(picture.snp.bottom).offset(80)
            make.leading.equalToSuperview().inset(80)
            make.width.equalTo(200)
            
        }
    }
}
