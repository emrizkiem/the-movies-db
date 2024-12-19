//
//  BaseViewController.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 17/12/24.
//

import UIKit

open class BaseViewController: UIViewController {
  
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
  
  open override func viewDidLoad() {
    super.viewDidLoad()
    
    requestAPI()
    configureViews()
    observeViewModel()
  }
  
  open override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationBar()
  }
  
  open override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    self.isTransparentNavigationBar = true
  }
  
  internal override func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
    navigationController?.popViewController(animated: true)
  }
  
  open func navigationBar() {
  }
  
  open func configureViews() {
  }
  
  open func requestAPI() {
  }
  
  open func observeViewModel() {
  }
}

