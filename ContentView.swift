import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jokesVM = JokesViewModel()
    
    var body: some View {
        NavigationView{
            List(jokesVM.jokes, id: \.self) { element in
                
                Text(element)
                
            }
            .toolbar{
                Button(action: {
                    addJoke()
                }, label: {
                    Text("Get New Joke")
                })
            }
            .navigationTitle("Jokes")
        }
    }
    
    func addJoke(){
        jokesVM.getJokes()
    }
    
}
