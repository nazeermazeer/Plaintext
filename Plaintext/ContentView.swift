//
//  ContentView.swift
//  Plaintext
//
//  Created by Nazeer Zeerak on 3/1/26.
///Users/nazeer/Documents/Repositories/Plaintext/Plaintext/ContentView.swift

import SwiftUI
import SwiftData

let screenSize = NSScreen.main?.frame.size ?? CGSize(width: 300, height: 300)

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @StateObject private var content = text()
    
    var body: some View {
        GeometryReader{ geo in
            ZStack(alignment: .bottom){
                ScrollView([.vertical]){
                    VStack(alignment: .leading){
                        Text(content.headingtext)
                            .font(.custom("SF Pro", size: 36, relativeTo: .title))
                            .fontWeight(.heavy)
                            .padding(.top, 50)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(content.subheadingtext)
                            .font(.custom("SF Mono", size: 12, relativeTo: .subheadline))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(content.bodytext)
                            .font(.custom("SF Pro", size: 18, relativeTo: .body))
                            .padding(.bottom, 50)
                            .padding(.top, 25)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)

                    }
                    .frame(minHeight: geo.size.height)
                    .layoutPriority(1)
                    .id(geo.size.height)
                    .frame(maxWidth: min(1000, geo.size.width - 80), alignment: .leading)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 50)
                    .textSelection(.enabled)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                }
                .background(Color.black)
            }
        }
        .frame(alignment: .topLeading)
        .foregroundStyle(.white)
        
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
