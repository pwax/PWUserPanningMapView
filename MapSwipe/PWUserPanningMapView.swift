//
//  PWUserPanningMapView.swift
//  MapSwipe
//
//  Created by Perry Waxman on 7/28/16.
//  Copyright © 2016 P.W. All rights reserved.
//

import UIKit
import MapKit

class PWUserPanningMapView: MKMapView, UIGestureRecognizerDelegate {
    
    //MARK: - properties
    private var panGestureRecognizer: UIPanGestureRecognizer!
    
    //default to true
    var shouldPanAroundUser: Bool?
    
    //default to 20
    var pitchThreshold: CGFloat?
    
    //MARK: - initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    convenience init(){
        self.init()
        self.setup()
    }
    
    
    //MARK: - helper functions
    
    private func setup(){
        //setup our pan gesture recognizer
        self.panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        self.panGestureRecognizer.delegate = self
        self.addGestureRecognizer(panGestureRecognizer)
        //should pan around user is true by default
        shouldPanAroundUser = true
        //default pitch threshold
        self.pitchThreshold = 20
    }
    
    @objc private func panGesture(pan: UIPanGestureRecognizer){
        
        //check our threshold and tracking mode
        if self.camera.pitch >= pitchThreshold && userTrackingMode == .Follow{
            //change our heading based on the x position of our pan
            self.camera.heading = Double(pan.translationInView(self).x)
        }
        
    }
    
    //MARK: - UIGestureRecognizerDelegate
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        //don't acknowledge simultaneous gestures if we're using multiple touches; smooths out interaction
        if gestureRecognizer.numberOfTouches() >= 2 {
            return false
        }else{
            return true
        }
        
    }
    
    
    
    
    

}
