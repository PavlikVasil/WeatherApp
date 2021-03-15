//
//  AddNewCityViewController.swift
//  WeatherApp
//
//  Created by Павел on 12.03.2021.
//

import UIKit

class AddNewCityViewController: UIViewController {
    
    // MARK: - Properties
    let cellId = "cellId"
    var addNewCityViewModel: AddNewCityViewModel!
    var delegate: WeatherViewControllerDelegate?
    var pendingRequestWorkItem: DispatchWorkItem?
   
    // MARK: - UI elements
    var addNewCityBackgroundView: UIView!
    var closeAddNewCityVCButton: UIButton!
    var citySearchBar: UISearchBar!
    var searchResultsTableView: UITableView!
    var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - Life cicle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewCityViewModel.delegate = self
        
        makeAddNewCityBackgroundView()
        makeCloseAddNewCityVCButton()
        makeCitySearchBar()
        makeSearchResultsTableView()
        addGestureRecognizer()
    }
}
