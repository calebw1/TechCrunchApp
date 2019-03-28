
import UIKit


class Article {
    var title: String?
    var description: String?
    var url: String?
    var imageName: String?
    var author: String?
    var content: String?
    
}

class NewsController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getArticles()
        
        navigationController!.navigationBar.barTintColor = UIColor(red: 38/255, green: 35/255, blue: 35/255, alpha: 1.0)
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.title = "TechCrunch"
        
        collectionView.alwaysBounceVertical = true
        
        collectionView.backgroundColor = UIColor(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1.0)
        
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newsCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! NewsCell
        
        if let title = articles[indexPath.item].title {
            newsCell.titleLabel.text = title
        }
        
        if let description = articles[indexPath.item].description {
            newsCell.descriptionLabel.text = description
        }
        
        if let imageName = articles[indexPath.item].imageName {
            //newsCell.thumbnailView.image = UIImage(named: "cutedog")
            newsCell.thumbnailView.downloadImage(from: imageName)
        }
       
        newsCell.backgroundColor = UIColor(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1.0)
        
        return newsCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let description = articles[indexPath.item].description {
            
            let rect = NSString(string: description).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
            
            let knownHeight: CGFloat = 16 + 200 + 8 + 40 + 4 + 8 + 1
            
            return CGSize(width: view.frame.width, height: rect.height + knownHeight + 18)
        }
        
        return CGSize(width: view.frame.width, height: 400)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let article = articles[indexPath.item]
        let layout = UICollectionViewFlowLayout()
        let newsDetailController = NewsDetailViewController(collectionViewLayout: layout)
        newsDetailController.article = article
        navigationController?.pushViewController(newsDetailController, animated: true)
       
    }
    
    
    func getArticles() {
        
        let jsonURLString = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=690a04379fbd45c8bdaf96a6dd94316a")!)
        
        let task = URLSession.shared.dataTask(with: jsonURLString) { (data,response,error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String : AnyObject]
                
                if let articlesFromJson = json["articles"] as? [[String : AnyObject]] {
                    for articleFromJson in articlesFromJson {
                        let article = Article()
                        if let title = articleFromJson["title"] as? String, let description = articleFromJson["description"] as? String, let url = articleFromJson["url"] as? String, let imageName = articleFromJson["urlToImage"] as? String, let author = articleFromJson["author"] as? String, let content = articleFromJson["content"] as? String {
                            
                            article.description = description
                            article.title = title
                            article.url = url
                            article.imageName = imageName
                            article.author = author
                            article.content = content
                        }
                        self.articles.append(article)
                    }
                }
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            } catch let error {
                print(error)
            }
            
        }
        
        task.resume()
        
    }
    
}
