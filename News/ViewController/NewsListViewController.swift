import UIKit

class NewsListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView?
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView?
    
    private let cellIdentifier = "cell"
    
    private var newsList = [News]() {
        didSet {
            tableView?.reloadData()
        }
    }
    
    private var newsLoader = NewsLoader()
    
    override func viewDidLoad() {
        tableView?.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
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
            let news = await newsLoader.loadNews()
            await MainActor.run {
                newsList = news
                hideLoadingIndicator()
            }
        }
    }
}

extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NewsCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewsCell
        cell.configure(with: newsList[indexPath.row])
        return cell
    }
}
