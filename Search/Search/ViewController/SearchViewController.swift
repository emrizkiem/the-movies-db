//
//  SearchViewController.swift
//  Search
//
//  Created by M. Rizki Maulana on 19/12/24.
//

import UIKit

class SearchViewController: UIViewController {
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
  }
}
