import UIKit
import BackgroundTasks


class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let result = BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.example.BGCounter.refresh", using: nil) { task in
            // Handle the task in your app.
            BGTaskSchedulerHelper.shared.handleAppRefresh(task: task as! BGAppRefreshTask)
        }
        print("등록!")
        if result {
            print("Background task registered successfully")
        } else {
            print("Failed to register background task")
        }
        BGTaskSchedulerHelper.shared.scheduleAppRefresh() // Schedules the first background refresh task.
        return true
    }
    
    // Other AppDelegate methods as required...
}
