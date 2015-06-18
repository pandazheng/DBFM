import UIKit

class HTTPController:NSObject{
    //定义一个代理
    var delegate:HttpProtocol?
    //接收网址，回调代理的方法传回数据
    func onSearch(url:String){
        Alamofire.manager.request(Method.GET, url).responseJSON(options: NSJSONReadingOptions.MutableContainers) { (_, _, data, error) -> Void in
            self.delegate?.didRecieveResults(data!)
        }
    }
}
//定义http协议
protocol HttpProtocol {
    //定义一个方法，接收一个参数：AnyObject
    func didRecieveResults(results:AnyObject)
}
