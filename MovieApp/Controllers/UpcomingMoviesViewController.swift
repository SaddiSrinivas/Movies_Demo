//
//  UpcomingMoviesViewController.swift
//  MovieApp
//
//  Created by mac on 15/01/21.
//

import UIKit

class UpcomingMoviesViewController: UIViewController {

    // MARK : - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [MoviesResults]()

    
    // MARK : - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.GetUpcomingMovies()
    }
    
    func setupTableView() {
        self.tableView.register(UINib.init(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
    }
    
    private func GetUpcomingMovies() {
        
        let queryItems:[String:String] = ["api_key": "e29482f621f0d60ced01b19944302ab5"]
        self.showLoader()
        APIService.shared.GET(endpoint: APIService.Endpoint.upcoming, queryItems: queryItems, headers: [:]) { (result:Result<UpcomingMovies,APIService.APIError>) in
            
            self.hideLoader()
            switch result {
            
            case let .success(response):
                
                guard let movies = response.results else { return }
                self.movies = movies
                self.tableView.reloadData()
            print("string")
                break
                
            case let .failure(error):
                
                print(error.localizedDescription)
                break
                
            }
        }
    }

}


// Mark : - UITableViewDelegate Methods

extension UpcomingMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        cell.item = movies[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MovieDetaislViewController") as! MovieDetaislViewController
        nextViewController.movie = self.movies[indexPath.row]
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension UpcomingMoviesViewController: UITabBarDelegate {
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {

        print("selected tab is : - \(item)")
    }
}
