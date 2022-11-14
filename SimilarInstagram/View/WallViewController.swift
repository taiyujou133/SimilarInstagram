//
//  ViewController.swift
//  SimilarInstagram
//
//  Created by Tai on 2022/11/14.
//

import UIKit

class WallViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) in main bundle:\n\(error)")
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
    


    @IBAction func decodeJsonAction(_ sender: Any) {
        let searchResponse: IGResponse = load("iambaijiji")
        print(searchResponse)
    }
}

