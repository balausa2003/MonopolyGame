//
//  ViewController.swift
//  MonopolyPlay
//
//  Created by Балауса Косжанова on 19.02.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    var sumOfDices1 = 1
    var sumOfDices2 = 1
    var player = AllPlayers()
    var monopoly = MonopolyBrain()
    var imgName = [String]()
    let img: [String:Int] =  ["DiceOne": 1 , "DiceTwo":2 , "DiceThree":3 , "DiceFour":4 , "DiceFive":5 , "DiceSix":6]
    var pressed = 0
    lazy private var map: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "map")
        return imgView
        
    }()
    lazy private var dice1: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "DiceOne")
        return imgView
    }()
    lazy private var dice2: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "DiceOne")
        return imgView
    }()
    lazy private var rollButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Roll Dice", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 5
        return btn
    }()
    lazy private var nameInfoLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Copperplate-Bold", size: 15.0)!
        label.numberOfLines = 2
        label.tintColor = .red 
        return label
        
    }()
    lazy private var priceInfoLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Copperplate-Bold", size: 15.0)!
        return label
        
    }()
    
    lazy private var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Start The Game!"
        
        label.font = UIFont(name: "Copperplate-Bold", size: 15.0)!
        return label
        
    }()
    lazy private var buyButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Buy", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.setTitleColor(.red, for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 5
        return btn
    }()
  
    lazy private var skipButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Skip", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 12)
        btn.setTitleColor(.red, for: .normal)
        btn.backgroundColor = .black
        btn.layer.cornerRadius = 5
        return btn
    }()
    lazy private var firstPButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("1'st Player", for: .normal)
        btn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)!
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.layer.cornerRadius = 5
        
        return btn
    }()
    lazy private var secondPButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("2'nd Player", for: .normal)
        btn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)!
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 5
        return btn
    }()
    lazy private var firstPlayerPlace: UILabel = {
        let label = UILabel()
        label.text = "$200 000"
        
        label.font = UIFont(name: "Copperplate-Bold", size: 15.0)!
        return label
    }()
    lazy private var secondPlayerPlace: UILabel = {
        let label = UILabel()
        label.text = "$200 000"
        label.font = UIFont(name: "Copperplate-Bold", size: 15.0)!
        return label
    }()
    
    lazy private var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "! Press the buttons to see the info !"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 10)!
        return label
    }()
    
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
        setUpViews()
        setUpConstraints()
        
        firstPButton.addTarget(self, action: #selector(pressedTheButton1), for: .touchUpInside)
        secondPButton.addTarget(self, action: #selector(pressedTheButton2), for: .touchUpInside)
        rollButton.addTarget(self, action:#selector(rollButtonPressed), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(skipButtonPressed) , for: .touchUpInside)
        super.viewDidLoad()
       
    }
   
   
    @objc
    func rollButtonPressed() {
        for i in img {
            imgName.append(i.key)
        }
        let random1 = imgName.randomElement()!
        let random2 = imgName.randomElement()!
        sumOfDices1 = img[random1]! + img[random2]!
        sumOfDices2 = img[random1]! + img[random2]!
        dice1.image = UIImage(named: random1 )
        dice2.image = UIImage(named: random2)
        pressed += 1
        updateTextLabel()
        print(pressed)
        
    }
    func updateTextLabel() {
       
        if pressed % 2 != 0 {
            textLabel.text = "It is \(player.players[0].name) turn."
            textLabel.textColor = .blue
            sumOfDices1 += player.gettingPosition1()
            player.players[0].position = sumOfDices1
            updateLabel1()
            buyButton.addTarget(self, action: #selector(addPlaces1), for: .touchUpInside)
            print("Sum1: \(sumOfDices1)")
        }
        if pressed % 2 == 0 {
        
            textLabel.text = "It is \(player.players[1].name) turn."
            textLabel.textColor = .red
            sumOfDices2 += player.gettingPosition2()
            player.players[1].position = sumOfDices2
            updateLabel2()
            buyButton.addTarget(self, action: #selector(addPlaces2), for: .touchUpInside)
            print(player.players[1].myPlace)
            print("Sum2: \(sumOfDices2)")
        }
    }
    
    func updateLabel1() {
        
        if sumOfDices1 <= 21 {
            nameInfoLabel.text = monopoly.monopolies[sumOfDices1-1].name
            priceInfoLabel.text = "$\(monopoly.monopolies[sumOfDices1-1].price)"
        } else if sumOfDices1 == 0 {
            nameInfoLabel.text = ""
        }
        else {
            sumOfDices1 = 1
            player.players[0].position = 1
        }
    }
    func updateLabel2() {
        
        if sumOfDices2 <= 21 {
            nameInfoLabel.text = monopoly.monopolies[sumOfDices2 - 1].name
            priceInfoLabel.text = "$\(monopoly.monopolies[sumOfDices2-1].price)"
        }else if sumOfDices2 == 0 {
            nameInfoLabel.text = ""
        } else {
            sumOfDices2 = 1
            player.players[1].position = 1
        }
    }
    @objc
    func addPlaces1() {
        if sumOfDices1 < 22 {
            player.players[0].myPlace.append(monopoly.monopolies[sumOfDices1-1].name)
            priceCalculating1()
        } else {
            
        }
    }
    @objc
    func addPlaces2() {
        if sumOfDices2 < 22 {
            player.players[1].myPlace.append(monopoly.monopolies[sumOfDices2-1].name)
            priceCalculating2()
        } else {
            sumOfDices2 = 0
            player.players[1].position = 0
        }
    }
    func priceCalculating1() {
        
        player.players[0].wallet -= monopoly.monopolies[sumOfDices1-1].price
        firstPlayerPlace.text = "$\(player.players[0].wallet)"
        
        }
    func priceCalculating2() {
        player.players[1].wallet -= monopoly.monopolies[sumOfDices2-1].price
        secondPlayerPlace.text = "$\(player.players[1].wallet)"
    }
    @objc
    func pressedTheButton1() {
        let nextViewController = FirstPlayerViewController()
        nextViewController.text = player.players[0].myPlace.joined(separator: ",")
        self.navigationController?.pushViewController(nextViewController, animated:false)
    }
    @objc
    func pressedTheButton2() {
        let nextViewController = SecondPlayerViewController()
        nextViewController.text = player.players[1].myPlace.joined(separator: ",")
        self.navigationController?.pushViewController(nextViewController, animated:false)
    }
    @objc
    func skipButtonPressed() {
        if pressed % 2 != 0 {
            textLabel.text = "It is \(player.players[0].name) turn."
            textLabel.textColor = .blue
            updateLabel1()
        }
        if pressed % 2 == 0 {
            textLabel.text = "It is \(player.players[1].name) turn."
            textLabel.textColor = .red
            updateLabel2()
        }
        
    }
    
    
    
    
    

}
extension MainViewController {
    func setUpViews() {
        view.addSubview(map)
        view.addSubview(dice1)
        view.addSubview(dice2)
        view.addSubview(rollButton)
        view.addSubview(nameInfoLabel)
        view.addSubview(priceInfoLabel)
        view.addSubview(textLabel)
        view.addSubview(buyButton)
        view.addSubview(skipButton)
        view.addSubview(firstPButton)
        view.addSubview(secondPButton)
        view.addSubview(firstPlayerPlace)
        view.addSubview(secondPlayerPlace)
        view.addSubview(infoLabel)
        
        
    }
    func setUpConstraints() {
        map.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(15)
            
        }
        dice1.snp.makeConstraints { make in
            make.top.equalTo(map.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(15)
            make.height.equalTo(50)
            make.width.equalTo(50)
            
        }
        dice2.snp.makeConstraints { make in
            make.top.equalTo(map.snp.bottom).offset(30)
            make.leading.equalTo(dice1.snp.trailing).offset(20)
            make.height.equalTo(50)
            make.width.equalTo(50)
            
        }
        rollButton.snp.makeConstraints { make in
            make.top.equalTo(map.snp.bottom).offset(35)
            make.leading.equalTo(dice2.snp.trailing).offset(15)
            make.width.equalTo(100)
            
        }
        nameInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(dice1.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(15)
            make.width.equalTo(150)
            
        }
        priceInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(dice1.snp.bottom).offset(20)
            make.leading.equalTo(nameInfoLabel.snp.trailing).offset(20)
            make.width.equalTo(50)
            
        }
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(nameInfoLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
            
        }
        buyButton.snp.makeConstraints { make in
            make.top.equalTo(dice1.snp.bottom).offset(15)
            make.leading.equalTo(priceInfoLabel.snp.trailing).inset(5)
            make.width.equalTo(50)
        }
        skipButton.snp.makeConstraints { make in
            make.top.equalTo(dice1.snp.bottom).offset(15)
            make.leading.equalTo(buyButton.snp.trailing).offset(10)
            make.width.equalTo(50)
        }
        firstPButton.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(15)
            make.width.equalTo(100)
           
        }
        secondPButton.snp.makeConstraints { make in
            make.top.equalTo(firstPButton.snp.bottom).offset(5)
            make.leading.equalToSuperview().inset(15)
            make.width.equalTo(100)
   
        }
        firstPlayerPlace.snp.makeConstraints { make in
            make.top.equalTo(textLabel.snp.bottom).offset(25)
            make.leading.equalTo(firstPButton.snp.trailing).offset(20)
            make.width.equalTo(300)
        }
        secondPlayerPlace.snp.makeConstraints { make in
            make.top.equalTo(firstPlayerPlace.snp.bottom).offset(25)
            make.leading.equalTo(secondPButton.snp.trailing).offset(20)
            make.width.equalTo(300)
        }
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(secondPlayerPlace.snp.bottom).offset(15)
            make.leading.equalToSuperview().inset(50)
            
        }
    }
}

