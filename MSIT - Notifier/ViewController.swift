//
//  ViewController.swift
//  MSIT - Notifier
//
//  Created by Abhishek Sansanwal on 18/01/19.
//  Copyright © 2019 Verved. All rights reserved.
//

import UIKit
import WebKit
import SwiftSoup

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    let webView = WKWebView()
    
    var counter = 0
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.run()
    }
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func run()
    {
        guard let url = URL(string: "https://www.msit.in") else { return }
        print(url.absoluteString)
        
        self.dataTask = defaultSession.dataTask(with: url)
        {
            data, response, error in
            
            defer { self.dataTask = nil }
            
            if let error = error
            {
                print(error.localizedDescription)
            }
            else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200
            {
                print("\(data.count) bytes received")
            }
        }
        dataTask?.resume()
    }
       
        /*
        
        let url = URL(string: "http://www.msit.in/notices#sds")!
        let request = URLRequest(url: url)
        webView.frame = CGRect(x: 0, y: 300, width: 300, height: 300)
        webView.load(request)
        view.addSubview(webView)
        // Do any additional setup after loading the view, typically from a nib.
    }*/
    
        func onSignTapped() {
        switch counter {
        case 0:
            //webView.evaluateJavaScript("document.getElementById('Email').value='\(emailTF.text!)'",completionHandler: nil)
            webView.evaluateJavaScript("document.getElementsByTagName('html')[0].innerHTML", completionHandler:  { (innerHTML, error) in
                do{
                    let response = try Response(_innerHTML: innerHTML)
                    print("got response")
                } catch{}
            })
        case 1:
            webView.evaluateJavaScript("document.getElementById('gaia_loginform').submit();",completionHandler: nil)
        case 2: break
        case 3: break
        case 4: break
        default: break
        }
        counter += 1
    }
}

