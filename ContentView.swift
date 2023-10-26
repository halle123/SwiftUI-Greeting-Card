//
//  ContentView.swift
//  Sheet
//
//  Created by Jehoida on 2023/10/22.
//

import SwiftUI


struct DismissingView1:View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack{
            Spacer()
            Button("Minimize"){
                dismiss()
                
            }
            .font(.title)
            .padding(.bottom)
            
            
        }
        
    }
}


struct ContentView: View {
    
    @State var showingDetail = false
    @StateObject var serverData = ServerViewMode()
    
    var body: some View {
        VStack {
            Spacer()
            VStack{
                Capsule()
                    .fill(Color.white)
                    .frame(width:400, height:60)
                    .overlay(
                Text("Happy Halloween")
                    .font(.custom("Lobster-Regular", size: 50))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.orange)
                    .padding())
                
                Spacer()
                Text("You're invited")
                    .font(.custom("Lobster-Regular", size: 40)) .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text(serverData.isConnected ? "To a Halloween Party" : "On 28/10")
                    .font(.custom("Lobster-Regular",size:30))
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.top,5)
                    .padding(.bottom,20)
            }
            .frame(height: UIScreen.main.bounds.height / 3.3)
          
            //Button
            
            
            Spacer()
            
            VStack{
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content:{
                    LinearGradient(gradient: Gradient(colors:[.white,.black]), startPoint: .top, endPoint: .bottom)
                     .clipShape(customShape())
             
                    
                    Button(action: {serverData.isConnected.toggle()}, label: {
                         
                             VStack(spacing:15){
                             
                             
                                 Image(systemName: "envelope")
                                     .font(.system(size:70))
                                     .foregroundColor(serverData.isConnected ? Color.red.opacity(0.6) : Color(.white))
                             
                                 Text(serverData.isConnected ? "Close" : "Open")
                                      .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                      .foregroundColor(.black)
                         }
                         
                         .padding(50)
                         .background(LinearGradient(gradient: Gradient(colors:[.black,.orange]), startPoint: .top, endPoint: .bottom))
                         .clipShape(Circle())
                         .padding(15)
                         .background(Color(.black).opacity(0.7))
                     
                         .clipShape(Circle())
                         .padding(15)
                         .background(Color(.orange).opacity(0.7))
                         .clipShape(Circle())
                         
                     })
                         .offset(y: -65)
                         .padding(.bottom,-65)
                        
                         })
                 
                 .padding(.top,60)
                
                Spacer()
                VStack{
                    Button("More details")
                    {
                        showingDetail = true
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(.black)
                    .tint(.orange)
                    .sheet(isPresented:$showingDetail)
                    {
                        ZStack{
                            Color.orange.edgesIgnoringSafeArea(.all)
                            Text("Location: NDHU Athletic Field Time:10:00PM")
                                
                                .font(.custom("Lobster-Regular", size: 50))                            .presentationDetents([.medium, .large])
                                
                            DismissingView1()                        }
                        /*Text("This is the expandable bottom sheet.")
                            .font(.custom("Lobster-Regular", size: 50))                            .presentationDetents([.medium, .large])
                            
                        DismissingView1()*/
                    }
                    
                    
                    
                    
                }
               
                       
                
                       
                

                
            }
                
        
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            ZStack{
                LinearGradient(gradient: Gradient(colors:[.white,.black,.white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                Color.black.opacity(0.1)
                    .ignoresSafeArea(.all, edges: .top)
            
            }
        )
    }
}

#Preview {
    ContentView()
}
