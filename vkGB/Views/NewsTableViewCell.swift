
import UIKit

class NewsTableViewCell: UITableViewCell {
    


    @IBOutlet weak var avatarUserNews: AvatarsView!
    @IBOutlet weak var nameUserNews: UILabel!
    @IBOutlet weak var dateNews: UILabel!
    @IBOutlet weak var textNews: UILabel!
    
    @IBOutlet weak var showMore: UIButton!
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var textNewPost: UITextView!
    
    @IBOutlet weak var textNewsPostHeight: NSLayoutConstraint!
    @IBOutlet weak var commentsCount: UIButton!
    @IBOutlet weak var repostsCount: UIButton!
    @IBOutlet weak var viewsCount: UIButton!
    @IBOutlet weak var likesCount: LikeControl!
    
    
    @IBAction func showMore(_ sender: Any) {
        
        let size = textNewPost.frame.size.height
        if size <= 200.5 {
            textNewPost.adjustUITextViewHeightToFit()
            showMore.setTitle("Показать меньше...", for: .normal)
        } else {
            textNewPost.adjustUITextViewHeightToDefault()
            showMore.setTitle("Показать полностью...", for: .normal)
        }
    }
    
    
    func resetStateButtonShowMore() {
        showMore.isHidden = false
        showMore.setTitle("Показать полностью...", for: .normal)
    }
}


extension UITextView {
    func adjustUITextViewHeightToFit() {
        self.translatesAutoresizingMaskIntoConstraints = true
        self.sizeToFit()
    }
    
    func adjustUITextViewHeightToDefault() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
