//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Александр Касьянов on 17.01.2023.
//

import Foundation
import NetworkLayer

class CharactersViewModel: ObservableObject {
    @Published var characters: [ModelCharacter] = []
    private var currentPage = 1
    private var maxPage = 100
    var isLoading = false
    
    func fetchCharacters() {
        guard !isLoading else { return }
        guard currentPage < maxPage else { return }
        
        isLoading = true
        CharactersAPI.getAllCharacters(page: currentPage) { [weak self] data, error in
            if error == nil {
                self?.isLoading = false
                self?.characters.append(contentsOf: data?.results ?? [])
                self?.maxPage = data?.info.pages ?? 0
                self?.currentPage += 1
            } else {
                self?.isLoading = false
            }
        }
    }
}
