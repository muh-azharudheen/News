import UIKit

class NewsListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView?
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView?
    
    private let cellIdentifier = "cell"
    
     var newsList = [Article]()
    
    
   private var newsLoader = NewsLoader()
    
    override func viewDidLoad() {
        tableView?.register(UINib(nibName: "Cell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        loadNewsWithLoadingIndicator()
    }
    
    private func showLoadingIndicator() {
        activityIndicator?.startAnimating()
    }
    
    private func hideLoadingIndicator() {
        activityIndicator?.stopAnimating()
    }
    
    private func loadNewsWithLoadingIndicator() {
        showLoadingIndicator()
        Task {
            newsList = await newsLoader.loadNews()
             DispatchQueue.main.async {
                 self.hideLoadingIndicator()
                 self.tableView?.reloadData()
            }
        }
       
    }

}
    extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            newsList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let sourceData = newsList[indexPath.row]
            cell.backgroundColor = .gray
            cell.textLabel?.text = sourceData.title
            cell.detailTextLabel?.text = sourceData.publishedAt
            return cell
        }
        
    }

