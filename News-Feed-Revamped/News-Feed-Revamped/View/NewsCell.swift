import UIKit

class NewsCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let thumbnailView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let titleLabel: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.textColor = UIColor.white
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1.0)
        return textView
    }()
    
    let descriptionLabel: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = UIColor.white
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1.0)
        return textView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    func setupViews() {
        //backgroundColor = UIColor(red: 232/255, green: 235/255, blue: 241/255, alpha: 1.0)
        
        addSubview(thumbnailView)
        addSubview(separatorView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: thumbnailView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: titleLabel)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: descriptionLabel)
        addConstraintsWithFormat(format: "V:|-16-[v0(200)]-8-[v1(40)]-4-[v2]-8-[v3(1)]|", views: thumbnailView, titleLabel, descriptionLabel, separatorView)
        
    
    }
    
    
}

