//
//  LottiAnimationView.swift
//  UI-535
//
//  Created by nyannyan0328 on 2022/04/07.
//

import SwiftUI
import Lottie

struct LottiAnimationView: UIViewRepresentable {
    let lottie : String
    @Binding var progress : CGFloat
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        view.backgroundColor = .clear
        animationView(rootView: view)
        return view
        
        
        
    }
    func updateUIView(_ uiView: UIView, context: Context) {
        
        uiView.subviews.forEach { view in
            if view.tag == 1009{
                
                
                view.removeFromSuperview()
            }
            
            animationView(rootView: uiView)
        }
        
        
    }
    
    func animationView(rootView : UIView){
        
        let animationView = AnimationView(name: lottie,bundle: .main)
        animationView.backgroundColor = .clear
        animationView.currentProgress = 0.49 + (progress / 2)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        
        animationView.tag = 1009
        
        let contains = [
        
        
            animationView.widthAnchor.constraint(equalTo: rootView.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: rootView.heightAnchor),
        
        ]
        
        rootView.addSubview(animationView)
        rootView.addConstraints(contains)
        
        
    }
}

