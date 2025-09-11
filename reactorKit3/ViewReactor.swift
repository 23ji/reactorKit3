//
//  ViewReactor.swift
//  reactorKit3
//
//  Created by 이상지 on 9/10/25.
//

import RxSwift
import ReactorKit

import Foundation

final class ViewReactor: Reactor {
 
  //사용자의 행동
  enum Action {
    case buttonTapped
  }
 
  //상태 변화
  enum Mutation {
    case increaseCount
  }
  
  //뷰 상태
  struct State {
    var buttonTapCount: Int = 0
  }
  
  //초기 상태
  let initialState = State()
  
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .buttonTapped:
        return .just(.increaseCount)
    }
  }
  
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case .increaseCount:
      newState.buttonTapCount += 1
    }
    return newState
  }
}
