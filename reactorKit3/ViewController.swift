//
//  ViewController.swift
//  reactorKit3
//
//  Created by 23ji on 9/9/25.
//

import ReactorKit
import RxSwift
import RxCocoa

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
    self.button.rx.tap
      .map { ViewReactor.Action.buttonTapped }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)
    // state 구독
    reactor.state.map { $0.buttonTapCount }
      .subscribe(onNext: { count in
        print("버튼이 \(count)번 눌림")
      })
      .disposed(by: disposeBag)
  }
}
