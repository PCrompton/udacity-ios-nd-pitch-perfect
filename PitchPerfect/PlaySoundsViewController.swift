//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Paul Crompton on 7/1/16.
//  Copyright © 2016 Paul Crompton. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!

    var stopTimer: NSTimer?
    
    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb, Play }
    
    @IBAction func playSoundForButton(sender: UIButton) {
        print("\(self.dynamicType).playSoundForButton(\(sender))")
        switch(ButtonType(rawValue: sender.tag)!) {
        case .Slow: playSound(rate: 0.5)
        case .Fast: playSound(rate: 1.5)
        case .Chipmunk: playSound(pitch: 1000)
        case .Vader: playSound(pitch: -1000)
        case .Echo: playSound(echo: true)
        case .Reverb: playSound(reverb: true)
        case .Play: playSound()
        }
        configureUI(.Playing)
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        print("\(self.dynamicType).stopButtonPressed(\(sender))")
        stopAudio()
    
    }
    
    var recordedAudio: NSURL!
    
    override func viewDidLoad() {
        print("\(self.dynamicType).viewDidLoad()")
        super.viewDidLoad()
        setupAudio()
    }

    override func viewWillAppear(animated: Bool) {
        print("\(self.dynamicType).viewWillAppear(\(animated))")
        configureUI(.NotPlaying)
    }
    
    override func didReceiveMemoryWarning() {
        print("\(self.dynamicType).didReceiveMemoryWarning()")
        super.didReceiveMemoryWarning()
    }
}
