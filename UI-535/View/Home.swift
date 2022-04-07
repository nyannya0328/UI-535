//
//  Home.swift
//  UI-535
//
//  Created by nyannyan0328 on 2022/04/07.
//

import SwiftUI
import Lottie

struct Home: View {
   
    
    @State var offset : CGFloat = 0
    @GestureState var isDragging : Bool = false
    
    @State var currentSlderProgress : CGFloat = 0.5
    var body: some View {
        VStack{
            
            
            Text(getAttributed(string:"How was your\n        Food"))
                .font(.title.weight(.semibold))
                
                
            
            GeometryReader{proxy in
                let size = proxy.size
                
                LottiAnimationView(lottie: "Rating", progress: $currentSlderProgress)
                    .frame(width: size.width, height: size.height)
                    .scaleEffect(1.5)
                
            }
            
            ZStack{
                
                Rectangle()
                    .fill(.white)
                    .frame(height: 1)
                
                Group{
                    
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.black)
                        .frame(width: 60, height: 60)
                    
                    Circle()
                        .fill(.white)
                        .frame(width: 17, height: 17)
                    
                    
                }
                .frame(maxWidth:.infinity)
                .contentShape(Rectangle())
                .offset(x: offset)
                .gesture(
                
                    DragGesture(minimumDistance: 0.5).updating($isDragging, body: { _, out, _ in
                        out = true
                    })
                    .onChanged({ value in
                        
                        let widht = UIScreen.main.bounds.width - 30
                        var translation = value.location.x
                        
                        translation = (translation > 30 ? translation : 30)
                        
                        translation = (translation < (widht - 30) ? translation : (widht - 30))
                        translation = isDragging ? translation : 0
                        
                        offset = translation - (widht / 2)
                        
                        let progress = (translation - 25) / (widht - 55)
                        
                        currentSlderProgress = progress
                        
                    })
                
                
                
                )
                
            }
            
            
        }
        .padding()
      
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        .overlay(alignment: .topTrailing, content: {
            
            Button {
                
            } label: {
                
                Image(systemName: "xmark")
                    .font(.title)
                    .foregroundColor(.gray)
                    .padding(10)
                    .background(.white,in: Circle())
            }
            .padding([.top,.trailing],10)

            
            
        })
        .background(
        
        
            LinearGradient(colors: [
            
            Color("BG1"),
            Color("BG2"),
            Color("BG3"),
            
            
            ], startPoint: .top, endPoint: .bottom)
        
        )
    }
    func getAttributed(string : String) -> AttributedString{
        
        var atr = AttributedString(stringLiteral: string)
        
        if let range = atr.range(of: "Food"){
            
            atr[range].foregroundColor = .white
            atr[range].font = .system(size: 30, weight: .black)
            
        }
        return atr
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
