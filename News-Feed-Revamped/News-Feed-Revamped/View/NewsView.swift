import UIKit

class NewsView: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = UIColor(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1.0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let thumbnailView: CustomImageView = {
        let imageView = CustomImageView()
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

    let authorLabel: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = UIColor.white
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1.0)
        return textView
    }()

    let contentLabel: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = UIColor.white
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.backgroundColor = UIColor(red: 45/255.0, green: 45/255.0, blue: 45/255.0, alpha: 1.0)
        return textView
    }()



    func setupViews() {
        //backgroundColor = UIColor(red: 232/255, green: 235/255, blue: 241/255, alpha: 1.0)

        addSubview(thumbnailView)
        addSubview(titleLabel)
        addSubview(contentLabel)
        addSubview(authorLabel)


        addConstraintsWithFormat(format: "H:|[v0]|", views: thumbnailView)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: titleLabel)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: contentLabel)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: authorLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(50)]-8-[v1(200)]-8-[v2(30)]-8-[v3]-8-|", views: titleLabel, thumbnailView, authorLabel, contentLabel )

    }

}





