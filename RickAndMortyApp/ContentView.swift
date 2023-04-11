//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Александр Касьянов on 17.01.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CharactersViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.characters) { character in
                let isLast = viewModel.characters.isLast(character)
                Text(character.name)
                    .onAppear {
                        if isLast {
                            viewModel.fetchCharacters()
                        }
                    }
                    .progressBar(isLoading: isLast && viewModel.isLoading)
            }
        }
        .onAppear {
            viewModel.fetchCharacters()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

private extension View {
    func progressBar(isLoading: Bool) -> some View {
        self
            .modifier(ProgressBarModifier(withLoading: isLoading))
    }
}
