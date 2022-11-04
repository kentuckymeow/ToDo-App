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
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            contentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),
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
        
        let titles = ["Welcome","location","all set", "goe"]
        for x in 0..<4 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) *  contentView.frame.size.width , y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height))
            scrollView.addSubview(pageView)
            
            // Tittle, image , button
            let label  = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width-20 , height: 120))
            let imageView  = UIImageView(frame: CGRect(x: 10, y: 10 + 120 + 10, width: pageView.frame.size.width - 20 , height: pageView.frame.size.height - 60 - 130 - 15))
            let button  = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height - 60, width: pageView.frame.size.width - 20 , height: 50))
            
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica-Bold", size: 32)
            pageView.addSubview(label)
            label.text = titles[x]
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named : "welcome_\(x)")
            pageView.addSubview(imageView)
            
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.setTitle("Countinue", for: .normal)
            if x == 3 {
                button.setTitle("go", for: .normal)
            }
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            button.tag = x+1
            pageView.addSubview(button)
            
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
