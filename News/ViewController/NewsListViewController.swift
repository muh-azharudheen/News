import UIKit

class NewsListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView?
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView?
    
    private let cellIdentifier = "cell"
    
     var newsList = [Source]()
    
    
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
            _ = await newsLoader.loadNews()
            await MainActor.run {
               // newsList = news
                hideLoadingIndicator()
            }
        }
        getData()
    }
    
    
    func getData() {
        guard  let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2024-01-08&to=2024-01-08&sortBy=popularity&apiKey=77554f5a7c564959bd5004d5438ce35d")else{
            return
        }
        let req = URLRequest(url: url)
        URLSession.shared.dataTask(with: req) { data, response, errr in
            if let data = data{
                let decoder = JSONDecoder()
                if let jsonData = try? decoder.decode(Article.self, from: data){
                    self.newsList = jsonData.source
                  
                }
                DispatchQueue.main.async{
                    self.tableView?.reloadData()
                }
                print(self.newsList)
            }
        }.resume()
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
            cell.textLabel?.text = sourceData.id
            cell.detailTextLabel?.text = sourceData.name
            return cell
        }
        
    }

