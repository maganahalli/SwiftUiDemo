//
//  SearchViewModel.swift
//  KmmMovie
//
//  Created by Venkatesh Maganahalli on 8/18/21.
//

import Foundation
import RxSwift

class SearchViewModel : ObservableObject {
    
    @Published var viewState : SearchState = .Init
    
    let disposableBag = DisposeBag()
    
    let repository: MovieRepository = MovieRepository()
    
    func loadMovies(query: String) {
        
        self.viewState = .Loading("Loading for \(query)")
        repository
            .searchMovies(query: query)
            .subscribe(
                onNext: { [weak self] response in
                    debugPrint(response)
                    
                    if response.results.count == 0 {
                        self?.viewState = .NoResultsFound
                    } else {
                        self?.viewState = .Fetched(response)
                    }
                    
                },
                onError: { error in
                    self.viewState = .ApiError("Unable to fetch Movies !!! Try different title")
                    debugPrint(error)
            }
        )
            .disposed(by: disposableBag)
    }
    
    
}

enum SearchState {
    case Init
    case Loading(String)
    case Fetched(MoviesResult)
    case NoResultsFound
    case ApiError(String)
}

