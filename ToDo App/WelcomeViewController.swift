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
    }
    
    override func viewDidLayoutSubviews() {
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
           scrollView.addSubview(pageView)
            
            // Tittle, image , button
            let imageView = UIImageView()
            let button = UIButton(frame: CGRect(x: 190, y: 800, width: 40, height: 40))
            let label = UILabel()
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named : "welcome_\(x)")
            pageView.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([

                imageView.leftAnchor.constraint(equalTo: pageView.leftAnchor, constant: 30),
                imageView.topAnchor.constraint(equalTo: pageView.topAnchor, constant: 150),
                imageView.widthAnchor.constraint(equalToConstant: 70),
                imageView.heightAnchor.constraint(equalTo: pageView.heightAnchor, multiplier: 0.3)
        
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
            
            pageView.addSubview(button)
//            NSLayoutConstraint.activate([
//               button.centerXAnchor.constraint(equalTo: pageView.centerXAnchor),
//               button.bottomAnchor.constraint(equalTo: pageView.bottomAnchor, constant: -100),
//               button.widthAnchor.constraint(equalToConstant: 100),
//                button.heightAnchor.constraint(equalTo: pageView.heightAnchor, multiplier: 0.2)
//            ])
            
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
    
}
