//
//  ContentView.swift
//  UIViewControllerRepresentableProject
//
//  Created by Divino Borges on 10/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            Text("Choose an Image!")
                .font(.largeTitle)
                .padding()
            Spacer()
            imageView
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    showImagePicker = true
                }
                .padding()
            Spacer()
            Spacer()
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView(selectedImage: $selectedImage)
        }
    }
    
    var imageView: Image {
        guard let selectedImage = selectedImage else {
            return Image(systemName: "photo")
        }
        return Image(uiImage: selectedImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
