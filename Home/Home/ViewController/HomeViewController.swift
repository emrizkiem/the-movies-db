//
//  HomeViewController.swift
//  Home
//
//  Created by M. Rizki Maulana on 19/12/24.
//

import UIKit

public class HomeViewController: UIViewController {
  private let viewModel = HomeViewModel()
  
  public init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    self.navigationController?.isNavigationBarHidden = true
    
    viewModel.fetchGenre()
  }
}
