//
//  BaseViewController.swift
//  TheMovieDb
//
//  Created by M. Rizki Maulana on 17/12/24.
//

import UIKit

public class BaseViewController: UIViewController {
  
  public var hideNavigationBar: Bool = true {
    didSet {
      self.navigationController?.isNavigationBarHidden = self.hideNavigationBar
    }
  }
  
  public var isTransparentNavigationBar: Bool = true {
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
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    requestAPI()
    configureViews()
    observeViewModel()
  }
  
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationBar()
  }
  
  public override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    self.isTransparentNavigationBar = true
  }
  
  override func leftNavigationBarButtonTapped(sender: UIBarButtonItem?) {
    navigationController?.popViewController(animated: true)
  }
  
  public func navigationBar() {
  }
  
  public func configureViews() {
  }
  
  public func requestAPI() {
  }
  
  public func observeViewModel() {
  }
}

