//
//  SolarGramViewModel.swift
//  SolarGram
//
//  Created by Alan Brantley on 3/23/23.
//

import SwiftUI

class SolarGramViewModel: ObservableObject {
    
    // MARK -
    @Published private var model: SolarGramPostsManager = SolarGramPostsManager()
}
