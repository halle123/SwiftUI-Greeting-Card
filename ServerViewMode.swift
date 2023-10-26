//
//  ServerViewMode.swift
//  Sheet
//
//  Created by Jehoida on 2023/10/26.
//

import SwiftUI

class ServerViewMode: ObservableObject {
  @Published var servers = [
    server(name: "You are invited to a Halloween Party"),
    server(name:"We hope you can make it!")
  
  ]
  @Published var isConnected = false
  @Published var showSheet = false
    
    
}
