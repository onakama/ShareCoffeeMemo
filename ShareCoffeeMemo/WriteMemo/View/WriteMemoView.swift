//
//  WriteMemoView.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import SwiftUI

struct WriteMemoView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = WriteMemoViewModel()
    @StateObject var tasteViewModel: StarViewModel = StarViewModel()
    @StateObject var bodyViewModel: StarViewModel = StarViewModel()
    @StateObject var roastViewModel: StarViewModel = StarViewModel()
    @State private var showingNullAlert = false
    @State var showingImagePicker = false

    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    if viewModel.coffeeName == "" || viewModel.saler == "" {
                        showingNullAlert = true
                        print("空のまま")
                    } else {
                        let memo = viewModel.makeMemo(taste: tasteViewModel.get(), body: tasteViewModel.get(), roast: roastViewModel.get())
                        saveMemo(memo: memo)
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }) {
                    Image(systemName: "plus.square")
                        .font(.title)
                        .padding(.trailing)
                        .padding(.top, 50)
                        .foregroundColor(Color("TextColor"))
                }
            }

            TextField("  Name", text: $viewModel.coffeeName)
                .font(.title)
                .padding(.leading)
                .keyboardType(.default)
            Divider()
                .background(Color("TextFrame"))
            TextField("  Store", text: $viewModel.saler)
                .font(.title)
                .padding(.leading)
                .keyboardType(.default)
            Divider()
                .background(Color("TextFrame"))
            Group{
                HStack{
                    Text("酸")
                    ForEach(0 ..< $tasteViewModel.stars.count, id: \.self) { starIndex in
                        Button(action: {
                            tasteViewModel.tap(starIndex: starIndex)
                        }) {
                            Text(tasteViewModel.stars[starIndex] ? "★": "☆")
                        }
                    }
                    .font(.title)
                    .foregroundColor(Color.yellow)
                    Text("苦")
                }
            }
            .padding(.bottom)
            Group{
                HStack{
                Text("軽")
                    ForEach(0 ..< $bodyViewModel.stars.count, id: \.self) { starIndex in
                    Button(action: {
                        bodyViewModel.tap(starIndex: starIndex)
                    }) {
                        Text(bodyViewModel.stars[starIndex] ? "★": "☆")
                    }
                }
                .font(.title)
                .foregroundColor(Color.yellow)
                Text("重")
                }
            }
            .padding(.bottom)
            Group{
                HStack{
                Text("浅")
                    ForEach(0 ..< $roastViewModel.stars.count, id: \.self) { starIndex in
                        Button(action: {
                            roastViewModel.tap(starIndex: starIndex)
                        }) {
                            Text(roastViewModel.stars[starIndex] ? "★": "☆")
                        }
                    }
                    .font(.title)
                    .foregroundColor(Color.yellow)
                    Text("深")
                }
                }
            .padding(.bottom)
            Button(action: {
                print("押した")
                showingImagePicker = true
            }){
                if viewModel.photo == nil {
                    HStack {
                        Text("Photo")
                        Image(systemName: "photo")
                    }
                    .font(.title)
                    .foregroundColor(.gray)
                    .border(Color("TextFrame"), width: 0.5)
                } else {
                    Image(uiImage: viewModel.photo!)
                        .resizable()
                        .frame(width: 200, height: 200)
                }
            }
            TextEditor(text: self.$viewModel.coffeeReview)
                .frame(height: 200)
                .border(Color("TextFrame"), width: 0.5)
                .padding()
                .keyboardType(.default)
                .foregroundColor(.gray)
        }
        .alert(isPresented: $showingNullAlert) {
            Alert(title: Text("Name,Storeが空です"))
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: $viewModel.photo)
        }
    }
        
    func saveMemo(memo: MemoModel) {
        viewModel.write(memo: memo)
        Task {
            do {
                try await viewModel.post(memo: memo)
            } catch {

            }
        }
    }
}

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct WriteMemoView_Previews: PreviewProvider {
    static var previews: some View {
        WriteMemoView()
    }
}
