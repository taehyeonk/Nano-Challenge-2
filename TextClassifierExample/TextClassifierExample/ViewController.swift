//
//  ViewController.swift
//  TextClassifierExample
//
//  Created by Priya Talreja on 01/12/19.
//  Copyright © 2019 Priya Talreja. All rights reserved.
//

import UIKit
import NaturalLanguage

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var showResultButton: UIButton!
    @IBOutlet weak var newsArticle: UITextView!
    
    private lazy var newsCategoryClassifier: NLModel? = {
        let model = try? NLModel(mlModel: NewsClassifier().model)
        return model
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showResultButton.isUserInteractionEnabled = false
        self.showResultButton.alpha = 0.5
        self.newsArticle.layer.borderColor = UIColor.lightGray.cgColor
        self.newsArticle.layer.borderWidth = 1.0
        self.newsArticle.layer.cornerRadius = 10
        self.newsArticle.textColor = UIColor.black
        self.newsArticle.text = ""
        self.resultLabel.text = ""
        self.newsArticle.becomeFirstResponder()
    }

    @IBAction func showResult(_ sender: UIButton) {
        if let label = newsCategoryClassifier?.predictedLabel(for: self.newsArticle.text) {
            switch label {
            case "연예_문화":
                self.resultImage.image = UIImage(named: "연예_문화")
                self.resultLabel.text = "연예_문화"
            case "사회":
                self.resultImage.image = UIImage(named: "사회")
                self.resultLabel.text = "사회"
            case "정치":
                self.resultImage.image = UIImage(named: "정치")
                self.resultLabel.text = "정치"
            case "스포츠":
                self.resultImage.image = UIImage(named: "스포츠")
                self.resultLabel.text = "스포츠"
            case "경제":
                self.resultImage.image = UIImage(named: "경제")
                self.resultLabel.text = "경제"
            case "생활":
                self.resultImage.image = UIImage(named: "생활")
                self.resultLabel.text = "생활"
            default:
                self.resultImage.image = UIImage(named: "기타")
                self.resultLabel.text = "기타"
            }
        }
    }
    
    @IBAction func clearAction(_ sender: UIButton) {
        self.resultImage.image = UIImage(named: "")
        self.resultLabel.text = ""
        self.newsArticle.text = ""
        self.showResultButton.isUserInteractionEnabled = false
        self.showResultButton.alpha = 0.5
    }
    
}

extension ViewController:UITextViewDelegate
{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if textView.text.isEmpty == false {
            self.showResultButton.isUserInteractionEnabled = true
            self.showResultButton.alpha = 1.0
        }
        return true
    }
    func textViewDidChange(_ textView: UITextView) {
        self.showResultButton.isUserInteractionEnabled = true
        self.showResultButton.alpha = 1.0
    }
}
