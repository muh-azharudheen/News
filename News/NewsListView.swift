
import SwiftUI

struct NewsListView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> NewsListViewController {
        NewsListViewController()
    }
    
    func updateUIViewController(_ uiViewController: NewsListViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = NewsListViewController
    
    
}
