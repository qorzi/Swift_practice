import BackgroundTasks

class BGTaskSchedulerHelper {
    static let shared = BGTaskSchedulerHelper()
    
    private init() {}
    
    func handleAppRefresh(task: BGAppRefreshTask) {
        task.expirationHandler = {
            task.setTaskCompleted(success: false)
        }
        
        Counter.shared.increment()
        print("App refresh task handled.")
        task.setTaskCompleted(success: true)
        scheduleAppRefresh()
    }
    
    func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: "com.example.BGCounter.refresh")
        request.earliestBeginDate = Date(timeIntervalSinceNow: 60) // 1 minute from now
        
        do {
            try BGTaskScheduler.shared.submit(request)
            print("App refresh task scheduled")
        } catch {
            print("Could not schedule app refresh: \(error)")
        }
    }
}
