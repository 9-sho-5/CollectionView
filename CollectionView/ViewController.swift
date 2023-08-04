//
//  ViewController.swift
//  CollectionView
//
//  Created by 楠瀬　法生 on 2023/08/04.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    
    // 表示する画像の配列
    let images = ["img","img","img","img","img","img"]
    // 表示するタイトルの配列
    let titles = ["title1","title2","title3","title4","title5","title6"]
    
    // 画面端からの余白
    let spacer: CGFloat = 16

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // collectionViewの表示設定
        let layout = UICollectionViewFlowLayout()
        // 縦スクロールに設定
        layout.scrollDirection = .vertical
        // セルの大きさを設定
        layout.itemSize = CGSize(width: view.frame.width / 2 - spacer * 2, height: view.frame.width / 2 - spacer * 2)
        layout.sectionInset = UIEdgeInsets(top: spacer, left: spacer, bottom: spacer, right: spacer)
        // それぞれに表示設定を適応させる
        collectionView.collectionViewLayout = layout
    }

    // 表示するセルの個数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    // セル内に表示するコンテンツの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        // Tag番号を使ってImageViewを作る
        let imageView = cell.contentView.viewWithTag(1)  as! UIImageView
        // 作ったImageViewに画像を指定する
        imageView.image = UIImage(named: images[indexPath.row])
        
        // Tag番号を使ってLabelを作る
        let titleLabel = cell.contentView.viewWithTag(2)  as! UILabel
        // 作ったLabelに文字を指定する
        titleLabel.text = titles[indexPath.row]
        
        return cell
    }

}

