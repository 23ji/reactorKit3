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

  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .red
  }
  
  
  func bind(reactor: ViewReactor) {
    reactor.action.onNext(.initialize)
    print("isInitialized :", reactor.initialState.isInitialized)

    
    reactor.state.map { $0.isInitialized }
      .subscribe(onNext: { value in
        print("🔥 isInitialized changed to:", value)
      })
      .disposed(by: disposeBag)
  }
}
