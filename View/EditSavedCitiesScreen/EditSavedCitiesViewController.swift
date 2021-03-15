//
//  EditSavedCitiesViewController.swift
//  WeatherApp
//
//  Created by Павел on 12.03.2021.
//

import UIKit

class EditSavedCitiesViewController: UIViewController {
    
    // MARK: - Properties
    let cellId = "cellId"
    var editSavedCitiesViewModel: EditSavedCitiesViewModel!
    var delegate: WeatherViewControllerDelegate?
    
    // MARK: - UI elements
    var editSavedCitiesBackgroundView: UIView!
    var closeEditSavedCitiesVCButton: UIButton!
    var savedCitiesTableView: UITableView!
    
    // MARK: - Life cicle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeEditSavedCitiesBackgroundView()
        makeCloseEditSavedCitiesVCButton()
        makeSavedCitiesTableView()
        addGestureRecognizer()
    }
}
