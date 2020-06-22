//
//  AddVoiceNoteViewController.swift
//  NoteApp_TeamPurple_FP
//
//  Created by user176475 on 6/22/20.
//  Copyright © 2020 Avani Patel. All rights reserved.
//

import UIKit
import AVKit

class AddVoiceNoteViewController: UIViewController {
    var audioRecorder:AVAudioRecorder!
    var audioRecorders: AVAudioRecorder!
    var audioPlayer : AVAudioPlayer!
    var meterTimer:Timer!
    var isAudioRecordingGranted: Bool!
    var isRecording = false
    var isPlaying = false
    @IBOutlet weak var recordingTimeLabel: UILabel!
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var btnPlay: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        check_record_permission()

        // Do any additional setup after loading the view.
    }
    func check_record_permission()
    {
        switch AVAudioSession.sharedInstance().recordPermission {
        case AVAudioSessionRecordPermission.granted:
            isAudioRecordingGranted = true
            break
        case AVAudioSessionRecordPermission.denied:
            isAudioRecordingGranted = false
            break
        case AVAudioSessionRecordPermission.undetermined:
            AVAudioSession.sharedInstance().requestRecordPermission({ (allowed) in
                    if allowed {
                        self.isAudioRecordingGranted = true
                    } else {
                        self.isAudioRecordingGranted = false
                    }
            })
            break
        default:
            break
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
