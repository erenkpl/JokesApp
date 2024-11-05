import Foundation
import Alamofire

var errCount = 0

class JokesViewModel : ObservableObject{
    
    @Published var jokes = [String]()
    
    init(){
        for _ in 1...5{
            if errCount == 0{
                getJokes()
            }
            else if errCount == 1{
                break
            }
        }
    }
    
    func getJokes() {
        
        AF.request("https://api.chucknorris.io/jokes/random", method: .get).responseDecodable(of: Welcome1.self) { response in
            
            switch response.result {
                case .success(let data):
                errCount = 0
                    let value = data.value
                    self.jokes.append(value)
                case .failure(let error):
                errCount = 1
                let errValue = error.localizedDescription
                self.jokes.append(errValue)
            }
            
        }
        
    }
    
}
