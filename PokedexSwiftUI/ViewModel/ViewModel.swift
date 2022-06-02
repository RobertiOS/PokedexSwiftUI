////
////  PokemonViewModel.swift
////  PokedexSwiftUI
////
////  Created by Robert on 2/28/22.
////
//
//import SwiftUI
//
//extension PokedexView {
//   @MainActor
//    class ViewModel: ObservableObject {
//        
//        @Published var pokemon = [Pokemon]()
//        
//        private var URL = "https://pokedex-bb36f.firebaseio.com/pokemon.jsos"
//        init() {
//            Task {
//                do {
//                try await getPokemonAsync()
//                } catch {
//                    
//                }
//                    
//            }
//        }
//
//        func getPokemonAsync() async throws {
//            guard let URL = Foundation.URL(string: URL) else { return }
//            
//            do {
//                guard let (data, response) = try? await URLSession.shared.data(from: URL)
//                else { throw RequestErrors.request(error: "error fetching data") }
//                guard let response = response as? HTTPURLResponse,
//                      response.statusCode == 200 else { throw RequestErrors.statusCodeError(errorCode: "Error on status code")  }
//                let pokemonData = try? JSONDecoder().decode([Pokemon?].self, from: data)
//                self.pokemon =  pokemonData?.compactMap { $0 } ?? []
//            } catch RequestErrors.request(let error) {
//                print(error)
//            } catch let jsonError as NSError {
//                print("JSON decode failed: \(jsonError.localizedDescription)")
//            }
//        }
//         
//        enum RequestErrors: Error {
//            case decoding
//            case request(error: String)
//            case statusCodeError(errorCode: String)
//        }
//    }
//
//}
