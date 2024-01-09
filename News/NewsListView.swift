
import SwiftUI

struct NewsListView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let storyboard = UIStoryboard(name: "News", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "navigation") as! UINavigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UINavigationController
    
    
}
