//
//  ContentView.swift
//  swift-practice
//
//  Created by 甘春雨 on 2022/9/9.
//

import SwiftUI

struct Country: Identifiable {
    let id: UUID = UUID()
    let name: String
}
class ViewModel: ObservableObject {
    
    @Published private(set) var countries: [Country] = []
    
    func loadCountries() {
        self.countries = [Country(name: "中国"), Country(name: "美国"), Country(name: "韩国"), Country(name: "德国"), Country(name: "法国"), Country(name: "英国")]
    }
    
    func removeCountry(_ index: Int) {
        self.countries.remove(at: index)
    }
}
struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        List{
            ForEach(viewModel.countries) { country in
                Text(country.name)
            }
            .onDelete{ index in
                self.viewModel.removeCountry(index.first!)
            }
        }.onAppear {
            self.viewModel.loadCountries()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
