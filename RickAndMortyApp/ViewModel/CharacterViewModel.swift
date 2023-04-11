//
//  CharacterViewModel.swift
//  RickAndMortyApp
//
//  Created by Александр Касьянов on 18.01.2023.
//

import Foundation
import NetworkLayer

class CharacterViewModel: ObservableObject {
    @Published var character = ModelCharacter(from: <#Decoder#>)
}
