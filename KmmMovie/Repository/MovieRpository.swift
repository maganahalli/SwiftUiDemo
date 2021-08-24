//
//  MovieRpository.swift
//  KmmMovie
//
//  Created by Venkatesh Maganahalli on 8/18/21.
//

import Foundation
import Alamofire
import RxSwift

class MovieRepository {
    
    func createRequest<T: Codable>(url: String) -> Observable<T> {
        
        let observable = Observable<T>.create { observer -> Disposable in
            
            Alamofire.request(url)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            // if no error provided by alamofire return .notFound error instead.
                            // .notFound should never happen here?
                            observer.onError(response.error ?? MovieError.runtimeError("random message"))
                            return
                        }
                        do {
                            let projects = try JSONDecoder().decode(T.self, from: data)
                            observer.onNext(projects)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        observer.onError(error)
                    }
            }
            return Disposables.create()
        }
        observable
        .observeOn(MainScheduler.instance)
        
        return observable
    }
    
    func searchMovies(query: String) -> Observable<MoviesResult> {
        return createRequest(url: "https://api.themoviedb.org/3/search/movie?api_key=7652af6f4c54c5b64bd1f568c9efb987&query=\(query)")
    }
}
