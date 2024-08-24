//
//  CustomSearchBarView.swift
//  DoctorsList
//
//  Created by Matvei Khlestov on 23.08.2024.
//

import SwiftUI

struct CustomSearchBarView: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            HStack {
                Image(.search)
                    .padding(.leading, 10)
                
                TextField("Поиск", text: $text)
                    .focused($isFocused)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 9)
                    .onTapGesture {
                        withAnimation {
                            isEditing = true
                        }
                    }
                
                if !text.isEmpty {
                    Button(action: {
                        text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.gray)
                    }
                    .padding(.trailing, 10)
                    .transition(.opacity)
                }
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .onChange(of: isFocused) {
                if !isFocused {
                    withAnimation {
                        isEditing = false
                    }
                }
            }
            
            if isEditing {
                Button(action: {
                    withAnimation {
                        isEditing = false
                        text = ""
                        isFocused = false
                    }
                }) {
                    Text("Cancel")
                        .foregroundStyle(.appPink)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
        .animation(.easeInOut, value: isEditing)
    }
}

#Preview {
    CustomSearchBarView(text: .constant("Text"))
}

