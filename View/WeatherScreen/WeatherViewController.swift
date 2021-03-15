//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Павел on 12.03.2021.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // MARK: - Properties
    let cellId = "cellId"
    var weatherViewModel: WeatherViewModel!
    
    // MARK: - UI elements
    var buttomView: UIView!
    var activityIndicatorBackgroundView: UIView!
    var activityIndicatorView: UIActivityIndicatorView!
    var copyright: UIImageView!
    var addNewCityButton: UIButton!
    var openAddedCitiesButton: UIButton!
    var swipeCollectionView: UICollectionView!
    var noDataForDisplayImageView: UIImageView!
    var someTroubleDescriptionLabel: UILabel!
    var isReloadViewCell: Bool = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Life cicle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        makeButtomView()
        makeOpenAddedCitiesButton()
        makeAddNewCityButton()
        makeNoDataForDisplayImageView()
        
        weatherViewModel.fetchData() {
            DispatchQueue.main.async { [weak self] in
                self?.swipeCollectionView.reloadData()
            }
        }
        makeSwipeCollectionView()
        makeRefreshActivityIndicator()
        //addGestureRecognizer()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.swipeCollectionView.reloadData()
    }
}
