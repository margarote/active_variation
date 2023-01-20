import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    private let METHOD_CHANNEL_MESSAGES = "messages"
    private let METHOD_CHANNEL_SCREENS = "screens"
    private let CALL_MESSAGE = "message"
    private let CALL_OPEN_DIALOG = "open_dialog"
    
    private var methodChannelMessages: FlutterMethodChannel? = nil
    private var methodChannelScreens: FlutterMethodChannel? = nil
    
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        let controller : FlutterViewController = window.rootViewController as! FlutterViewController
        let navigationController = UINavigationController.init(rootViewController: controller)
        
        window.rootViewController = navigationController
        
        self.methodChannelMessages = FlutterMethodChannel(name: METHOD_CHANNEL_MESSAGES, binaryMessenger: controller.binaryMessenger)
        self.methodChannelScreens = FlutterMethodChannel(name: METHOD_CHANNEL_SCREENS, binaryMessenger: controller.binaryMessenger)
        
        methodChannelScreens?.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            if call.method == self.CALL_OPEN_DIALOG {
                self.showDialog(window: navigationController)
            }
        })
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func showDialog(window: UIViewController) {
        let alert = UIAlertController(title: "Escolha uma opção", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Tabela", style: UIAlertAction.Style.default, handler: { UIAlertAction in
            self.methodChannelMessages?.invokeMethod(self.CALL_MESSAGE, arguments: false)
        }))
        alert.addAction(UIAlertAction(title: "Gráfico", style: UIAlertAction.Style.default, handler: { UIAlertAction in
            self.methodChannelMessages?.invokeMethod(self.CALL_MESSAGE, arguments: true)
        }))
        window.present(alert, animated: true)
    }
}
