//
//  BaseViewController.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 17/12/24.
//

import UIKit

class BaseViewController: UIViewController {
  
  var hideNavigationBar: Bool = true {
    didSet {
      self.navigationController?.isNavigationBarHidden = self.hideNavigationBar
    }
  }
  
  var isTransparentNavigationBar: Bool = true {
    didSet {
      if self.isTransparentNavigationBar {
        self.navigationController?.navigationBar.barTintColor = .clear
        self.navigationController?.navigationBar.transparentNavigationBar()
      } else {
        self.navigationController?.navigationBar.removeTransparancy()
        self.navigationController?.navigationBar.barTintColor = .white
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    requestAPI()
    configureViews()
    observeViewModel()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationBar()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    self.isTransparentNavigationBar = true
  }
  
  override func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
    navigationController?.popViewController(animated: true)
  }
  
  func navigationBar() {
  }
  
  func configureViews() {
  }
  
  func requestAPI() {
  }
  
  func observeViewModel() {
  }
}

