//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import RxSwift



/*:
 # BehaviorSubject
 */

let disposeBag = DisposeBag()

enum MyError: Error {
   case error
}

let publishSubject = PublishSubject<Int>()
publishSubject.subscribe { print("PublishSubject >>", $0) }
	.disposed(by: disposeBag)

let behaviorSubject = BehaviorSubject<Int>(value: 0)
behaviorSubject.subscribe { print("BehaviorSubject >>", $0) }
	.disposed(by: disposeBag)

behaviorSubject.onNext(1)

behaviorSubject.subscribe { print("BehaviorSubject2 >>", $0) }
	.disposed(by: disposeBag)

behaviorSubject.onCompleted()
//behaviorSubject.onError(MyError.error)

behaviorSubject.subscribe { print("BehaviorSubject3 >>", $0) }
	.disposed(by: disposeBag)
