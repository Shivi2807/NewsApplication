//
//  NewsDetailViewController.swift
//  FabHotelsAssignment
//
//  Created by Shivi Agarwal on 15/11/21.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    @IBOutlet weak var newsSubtitleLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var lastView: UIView!
    
    var newsImageURL: URL? = nil
    var newsTitle: String = ""
    var newsSubtitle: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastView.isHidden = true
        
        newsSubtitleLabel.text = newsSubtitle
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.sd_setImage(with: newsImageURL, completed: nil)
        newsTitleLabel.text = newsTitle
        newsImageView.clipsToBounds = true
        
        view.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didClickScreen))
        view.addGestureRecognizer(gesture)
        gesture.numberOfTapsRequired = 1

    }
    @objc func didClickScreen()
    {
        lastView.isHidden = false
        print("can see the view")
    }
 

}
