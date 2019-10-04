//
//  BBCAnalytics.swift
//  BBC News App
//
//  Created by Jatinder Pal Singh Khera on 02/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import Foundation

struct BBCAnalytics {
    static func trackEvent(event: BBCAnalyticsEvent) {
        BBCAnalyticsSessionManager.shared.queueEvent(event)
    }
}

final class BBCAnalyticsSessionManager {
    
    // MARK: - vars
    static let shared = BBCAnalyticsSessionManager(baseURL: URL(string: Application.Configuration.baseURL(path: "analytics"))!)
    
    private let baseURL: URL
    
    private let backgroundSession = URLSession(configuration: .background(withIdentifier: "uk.co.bbc.background.session.analytics"))
    
    // MARK: - Operation queue to help batch upload data
    let operationQueue = OperationQueue()
    private var queue = Queue<BBCAnalyticsEvent>()
    
    let timer = Timer.scheduledTimer(timeInterval: 10.0, target: BBCAnalyticsSessionManager.shared, selector: #selector(executeSync), userInfo: nil, repeats: true)
    
    // MARK: - Initialisation
    private init(baseURL: URL) {
        self.baseURL = baseURL
        operationQueue.maxConcurrentOperationCount = 1
    }
    
    // MARK: - Public methods
    func queueEvent(_ event: BBCAnalyticsEvent) {
        queue.enqueue(event)
    }
    
    func pause() {
        // TODO: implement
    }
    
    func stop() {
        self.timer.invalidate()
    }
    
    func start() {
        // TODO: implement
    }
    
    func resume() {
        // TODO: implement
    }
    
    // MARK: - Private methods
    private let syncQueue = DispatchQueue(label: "uk.co.bbc.background.queue.sync", attributes: .concurrent)
    private var synchingQueue = [BBCAnalyticsEvent]()
    @objc private func executeSync() {
        self.syncQueue.sync {
            if queue.isEmpty() == false {
                // Take first 10 to sync
                for _ in 1...10 {
                    if let event = queue.dequeue() {
                        synchingQueue.append(event)
                        
                        let urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
                        var queryItems = [URLQueryItem]()
                        for data in event.metaData {
                            let queryItem = URLQueryItem(name: data.name, value: data.value as? String)
                            queryItems.append(queryItem)
                        }
                        
                        var request = URLRequest(url: (urlComponents?.url)!)
                        request.httpMethod = "GET"
                        
                        let operation = PushAnalyticsOperation(session: backgroundSession, request: request, event: event, completion: { (event, data, response, error) -> (Void) in
                            
                            // assume all went well and remove
                            // in actuality you will want to queue again for retry
                            
                            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 200
                            if statusCode != 200 {
                                let string = String(data: data!, encoding: .utf8)
                                print("Server error \(String(describing: string))")
                            }
                            
                            if let index = self.synchingQueue.index(where: { (e) -> Bool in
                                e == event
                            }) {
                                 self.synchingQueue.remove(at: index)
                            }
                        })
                        operationQueue.addOperation(operation)
                    }
                }
            }
        }
    }
}

struct Queue<T> {
    fileprivate var queue = [T]()
    
    mutating func enqueue(_ item: T) {
        self.queue.insert(item, at: self.queue.count)
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty() else {
            return nil
        }
        return self.queue.remove(at: 0)
    }
    
    func count() -> Int {
        return self.queue.count
    }
    
    func isEmpty() -> Bool {
        return queue.count == 0
    }
}

class PushAnalyticsOperation : Operation {
    
    private var task : URLSessionDataTask!
    
    enum OperationState : Int {
        case ready
        case executing
        case finished
    }
    
    // default state is ready (when the operation is created)
    private var state : OperationState = .ready {
        willSet {
            self.willChangeValue(forKey: "isExecuting")
            self.willChangeValue(forKey: "isFinished")
        }
        
        didSet {
            self.didChangeValue(forKey: "isExecuting")
            self.didChangeValue(forKey: "isFinished")
        }
    }
    
    override var isReady: Bool { return state == .ready }
    override var isExecuting: Bool { return state == .executing }
    override var isFinished: Bool { return state == .finished }
    
    init(session: URLSession, request: URLRequest, event: BBCAnalyticsEvent, completion: ((BBCAnalyticsEvent, Data?, URLResponse?, Error?) -> (Void))?) {
        super.init()
        
        task = session.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            if let completion = completion {
                completion(event, data, response, error)
            }

            self?.state = .finished
        })
    }
    
    override func start() {
        /*
         if the operation or queue got cancelled even
         before the operation has started, set the
         operation state to finished and return
         */
        if(self.isCancelled) {
            state = .finished
            return
        }
        
        // set the state to executing
        state = .executing
        
        print("uploading \(self.task.originalRequest?.url?.absoluteString ?? "")")
        
        // start the downloading
        self.task.resume()
    }
    
    override func cancel() {
        super.cancel()
        
        // cancel the downloading
        self.task.cancel()
    }
}
