//
//  ContentView.swift
//  Ambar
//
//  Created by Anagh Sharma on 12/11/19.
//  Copyright © 2019 Anagh Sharma. All rights reserved.
//

import SwiftUI
import AppKit

struct ContentView: View {
    var body: some View {
        
        VStack(alignment:.leading, spacing: 5){
            
            Text("Connect")
            Divider()
            Text("Disconnect")
            Divider()
            Text("Help")
            Divider()
            Text("Quit")
//            Button(action: {
//                NSApplication.shared.terminate(self)
//            })
//            {
//                Text("Quit App")
//                .font(.caption)
//                .fontWeight(.semibold)
//            }
           
        }
   
        .frame(width: 130.0, height: 105.0, alignment: .top)
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
