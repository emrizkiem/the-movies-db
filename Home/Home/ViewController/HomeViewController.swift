//
//  HomeViewController.swift
//  Home
//
//  Created by M. Rizki Maulana on 19/12/24.
//

import UIKit
import Shared

public class HomeViewController: UIViewController {
  private let viewModel = HomeViewModel()
  
  public init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    initNavigationBar()
  }
  
  private func initNavigationBar() {
    setNavigationBar(type: .centerTitle(
      leftButtons: [createBackButton(icon: "ic_menu")],
      title: "Hey, Rizki Maul!",
      titleSize: 18,
      titleColor: .white,
      backgroundColor: Color.primaryColor
    ))
  }
}
