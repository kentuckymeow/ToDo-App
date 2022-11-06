//
//  WelcomeViewController.swift
//  ToDo App
//
//  Created by Arseni Khatsuk on 02.11.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    let contentView = UIView()
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor),
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        // Do any additional setup after loading the view.
    }
    
    override func  viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    
    private func configure() {
        // set up scrollview
        scrollView.frame = contentView.bounds
        contentView.addSubview(scrollView)
        
        let titles = ["Add your task to manage your daily shedule","Long press the task to edit or delete in one ","Let us give you a notification of you task on time", "Customize own theme color"]
        for x in 0..<4 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) *  contentView.frame.size.width , y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height))
            pageView.translatesAutoresizingMaskIntoConstraints = false
            //let pageView = UIView()
            //pageView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(pageView)
            
            
            
            
            // Tittle, image , button
            //let imageView  = UIImageView(frame: CGRect(x: 30, y: 10 , width: pageView.frame.size.width - 340, height: pageView.frame.size.height - 300))
           // let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
            let imageView = UIImageView()
        
           // let label  = UILabel(frame: CGRect(x: 30, y: 350, width: pageView.frame.size.width-60 , height: 120))
           //let button  = UIButton(frame: CGRect(x: 180, y: pageView.frame.size.height - 80, width: pageView.frame.size.width - 330, height: 50))
            let label = UILabel()
            let button = UIButton()
           
            
//            let button = UIButton(frame: CGRect(x: self.contentView.frame.size.width/2.3, y: self.contentView.frame.size.height/1.1, width: self.contentView.frame.size.width/9, height: self.contentView.frame.size.height/17))
//
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named : "welcome_\(x)")
            pageView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([

                imageView.leftAnchor.constraint(equalTo: pageView.leftAnchor, constant: 30),
                imageView.topAnchor.constraint(equalTo: pageView.topAnchor, constant: 150),
                imageView.widthAnchor.constraint(equalToConstant: 70),
                imageView.heightAnchor.constraint(equalTo: pageView.heightAnchor, multiplier: 0.3)
                
                //imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                //imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
            
            label.numberOfLines = 0
            label.textAlignment = .left
            label.font = UIFont(name: "Helvetica-Bold", size: 28)
            pageView.addSubview(label)
            label.text = titles[x]
            
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([

                label.leftAnchor.constraint(equalTo: pageView.leftAnchor, constant: 30),
                label.topAnchor.constraint(equalTo: pageView.topAnchor, constant: 250),
                label.widthAnchor.constraint(equalToConstant: 300),
                label.heightAnchor.constraint(equalTo: pageView.heightAnchor, multiplier: 0.3)
                
            
            ])
            
            button.setImage(UIImage(named: "next"), for: .normal)
            if x == 3 {
                button.setImage(UIImage(named: "check mark"), for: .normal)
            }
            
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
            button.contentMode = .scaleAspectFit
            button.tag = x+1
            
            button.translatesAutoresizingMaskIntoConstraints = false
            pageView.addSubview(button)
            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: pageView.centerXAnchor),
                button.bottomAnchor.constraint(equalTo: pageView.bottomAnchor, constant: -100),
                button.widthAnchor.constraint(equalToConstant: 100),
                button.heightAnchor.constraint(equalTo: pageView.heightAnchor, multiplier: 0.2)
            ])
//
            
            
        }
        
        scrollView.contentSize = CGSize(width: contentView.frame.size.width*3, height: 0)
        scrollView.isPagingEnabled = true
        
    }
    
    @objc func  didTapButton(_ button: UIButton) {
        guard button.tag < 4 else {
            Core.shared.setIsNotNewUser()
            dismiss(animated: true)
            return
        }
        scrollView.setContentOffset(CGPoint(x: contentView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
        
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
