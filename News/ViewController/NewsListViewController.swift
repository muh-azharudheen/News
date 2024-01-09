import UIKit

class NewsListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView?
    
    private let cellIdentifier = "cell"
    private var newsList = News.getNews()
    
    override func viewDidLoad() {
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = newsList[indexPath.row].title
        return cell
    }
}
