import UIKit

struct News {
    let title: String
    
    static func getNews() -> [News] {
        [
            .init(title: "A Title"),
            .init(title: "Another Title"),
            .init(title: "Yet Another Title"),
        ]
    }
}

class NewsListViewController: UIViewController {
    
    private let cellIdentifier = "cell"
    
    private var newsList = News.getNews()
    
    @IBOutlet private weak var tableView: UITableView?
    
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
