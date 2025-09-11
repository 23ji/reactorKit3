//
//  ViewController.swift
//  reactorKit3
//
//  Created by 23ji on 9/9/25.
//

import ReactorKit
import RxSwift

import UIKit

final class ViewController: UIViewController, View {
  
  var disposeBag = DisposeBag()
  var button = UIButton(type: .system)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .red
    
    self.button.setTitle("클릭!", for: .normal)
    self.button.center = self.view.center
    self.button.sizeToFit()
    self.view.addSubview(self.button)
  }
  
  
  func bind(reactor: ViewReactor) {
    // 액션 보내기

    // state 구독
    reactor.state.map { $0.isInitialized }
      .subscribe(onNext: { value in
        print("🔥 isInitialized changed to:", value)
      })
      .disposed(by: disposeBag)
  }
}
