import UIKit

class NewsDetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var article = Article()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationBar.barTintColor = UIColor(red: 38/255, green: 35/255, blue: 35/255, alpha: 1.0)
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationItem.title = "TechCrunch"
        
        collectionView.alwaysBounceVertical = true
        
        collectionView.backgroundColor = UIColor(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1.0)
        
        collectionView.register(NewsView.self, forCellWithReuseIdentifier: "cellID")
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newsPage = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! NewsView
        
        if let title = article.title {
            newsPage.titleLabel.text = title
        }
        
        if let content = article.content {
            newsPage.contentLabel.text = content
        }
        
        if let author = article.author {
            newsPage.authorLabel.text = author
        }
        
        if let imageName = article.imageName {
            newsPage.thumbnailView.downloadImage(from: imageName)
        }
        return newsPage
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let content = article.content {
        
            let rect = NSString(string: content).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
            
            let knownHeight: CGFloat = 8 + 50 + 8 + 200 + 8 + 30 + 8 + 8
            
            return CGSize(width: view.frame.width, height: rect.height + knownHeight + 18)
        }
        
        return CGSize(width: view.frame.width, height: 1000)
    }
}
