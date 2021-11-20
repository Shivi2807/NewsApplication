//
//  ViewController.swift
//  FabHotelsAssignment
//
//  Created by Shivi Agarwal on 15/11/21.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    private var newsModel = [NewsArticle]()
    private var results = [Articles]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "newsCell")
        newsTableView.dataSource = self
        newsTableView.delegate = self
        fetchTopStories()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func fetchTopStories()
    {
        APIManager.shared.getTopStories { [weak self] result in
            switch result
            {
            case .success(let apiResult):
                self?.results = apiResult
                self?.newsModel = (self?.results.compactMap({
                    NewsArticle(title: $0.title, subtitle: $0.content ?? "No Description", imageURL: URL(string: $0.urlToImage ?? ""))
                }))!
                
                DispatchQueue.main.async {
                    self?.newsTableView.reloadData()
                }
                
            case .failure(let error):
                print("Failed to cast data to News model \(error)")
            }
        }
    }
    
    func displayAlert()
    {
       print("No content here")
        let alert = UIAlertController(title: "Oops!!", message: "No content is currently available for this News item", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = newsModel[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell else
        {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = newsModel[indexPath.row]
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailVC
        vc.newsTitle = model.title
        guard let newsSubtitle = model.subtitle,  let imageURL = model.imageURL  else
        {
            displayAlert()
            return
        }
        vc.newsSubtitle = newsSubtitle
        vc.newsImageURL = imageURL
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
}

