//
//  AudioAnalizerService.swift
//  Week8
//
//  Created by JunHyuk Lim on 27/6/2023.
//

import Foundation
import AVFoundation
import SoundAnalysis
import CoreML

class AudioAnalizerService {
    // MARK: - Properties
    private var meowMLModel: CatMeowV1? = nil
    private var catMeowObserver: AudioAnalizerObserver? = nil
    private var catIdentifyObserver: AudioAnalizerObserver? = nil
    
    // MARK: - Initializer
    init() {
        let mlConfig = MLModelConfiguration()
        self.meowMLModel = try? CatMeowV1(configuration: mlConfig)
        self.catMeowObserver = AudioAnalizerObserver()
        self.catIdentifyObserver = AudioAnalizerObserver()
    }
    
    deinit {
        self.meowMLModel = nil
        self.catMeowObserver = nil
        self.catIdentifyObserver = nil
    }
    
    // MARK: - Functions
    func classifyMeowFeelingSound(audioFile: URL, completion: @escaping ([String: Double]?) -> Void) {
        guard let observer = self.catMeowObserver else {
            completion(nil)
            return
        }
        
        guard let meowMLModel = meowMLModel?.model,
              let soundRequest = try? SNClassifySoundRequest(mlModel: meowMLModel) else {
            debugPrint("Error trying to initialize the SoundRequest")
            completion(nil)
            return
        }
                
        guard let analyzer = try? SNAudioFileAnalyzer(url: audioFile) else {
            debugPrint("Error trying to initialize the SoundAnalizer")
            completion(nil)
            return
        }
                        
        guard let _ = try? analyzer.add(soundRequest, withObserver: observer) else {
            debugPrint("Error trying to add the sound request observer")
            completion(nil)
            return
        }
        
        observer.completion = completion
        analyzer.analyze()
    }
}
