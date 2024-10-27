//
//  LocalFileService.swift
//  RetoApuestaTotal
//
//  Created by Elver Mayta Hernández on 26/10/24.
//

import Foundation

class LocalFileService {
    static func loadJSON<T: Decodable>(from filename: String, as type: T.Type) -> T? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("No se pudo encontrar el archivo \(filename).json en el bundle.")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("Error al cargar y decodificar \(filename).json: \(error)")
            return nil
        }
    }
}
