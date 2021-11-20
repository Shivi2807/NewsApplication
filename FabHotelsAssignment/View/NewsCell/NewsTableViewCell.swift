//
//  NewsTableViewCell.swift
//  FabHotelsAssignment
//
//  Created by Shivi Agarwal on 15/11/21.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        newsImageView.layer.cornerRadius = 6
        newsImageView.clipsToBounds = true
        newsImageView.layer.masksToBounds = true
    }
    
    func configure(with model: NewsArticle)
    {
        subTitleLabel.text = model.subtitle
        newsLabel.text = model.title
        
        //Image
//        if let data = model.imageData
//        {
//            newsImageView.image = UIImage(data: data)
//        }
//            if let url = model.imageURL
//        {
//            //fetch
//            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//                guard let data = data, error == nil else
//                {
//                    return
//                }
//                model.imageData = data
//                DispatchQueue.main.async {
//                    self?.newsImageView.image = UIImage(data: data)
//                }
//            }.resume()
//        }
        
        
        newsImageView.sd_setImage(with: model.imageURL, placeholderImage: UIImage(named: "image"), options: .continueInBackground, context: .none)
        
        
    }
    @IBAction func likeButtonPressed(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
}
