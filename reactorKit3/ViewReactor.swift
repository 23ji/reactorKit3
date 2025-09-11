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
    case initialize
  }
 
  //상태 변화
  enum Mutation {
    case setIsInitialized(Bool)
  }
  
  //뷰 상태
  struct State {
    var isInitialized: Bool
  }
  
  //초기 상태
  let initialState: State = State(isInitialized: false)
  
  
  func mutate(action: Action) -> Observable<Mutation> {
    switch action {
    case .initialize:
      return .concat([
        .just(.setIsInitialized(true)),
        .just(.setIsInitialized(false))
      ])
    }
  }
  
  
  func reduce(state: State, mutation: Mutation) -> State {
    var newState = state
    switch mutation {
    case let .setIsInitialized(value):
      newState.isInitialized = value
    }
    return newState
  }
}
