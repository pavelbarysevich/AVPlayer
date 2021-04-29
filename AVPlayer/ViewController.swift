//
//  ViewController.swift
//  AVPlayer
//
//  Created by Павел Борисевич on 29.04.21.
//

import UIKit
import AVFoundation




class ViewController: UIViewController {
    //Outlet
    @IBOutlet weak var sliderValue: UISlider!
    
    var player = AVAudioPlayer()
    let slider = UISlider()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //slider
        slider.frame = CGRect(x: 50, y: 600, width: 300, height: 23)
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        view.addSubview(slider)
        
        //addTarget
        slider.addTarget(self, action: #selector(chengeSlider(sender:)), for: .valueChanged)
        
        do {
            if  let audioPatch = Bundle.main.path(forResource: "Cham LÃ©on - Dice", ofType: "mp3"){
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPatch))
                slider.maximumValue = Float(player.duration)
            }
        } catch  {
            print("ERROR")
        }
        player.play()
    }
    
  //MARK: - Method
    @objc func chengeSlider(sender: UISlider){
        if sender == slider{
            player.currentTime = TimeInterval(sender.value)
        }
    }
//MARK: - Action
    @IBAction func playButton(_ sender: UIButton) {
        player.play()
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        player.pause()
    }
    @IBAction func sliderValue(_ sender: UISlider) {
        player.volume = sliderValue.value
    }
}

