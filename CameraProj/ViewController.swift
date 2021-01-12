//
//  ViewController.swift
//  CameraProj
//
//  Created by LeoKikuta on 2021/01/12.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var photoImage: UIImageView!
    
    @IBAction func camerlaunch(_ sender: Any) {
        if UIImagePickerController .isSourceTypeAvailable(.camera) {
            print("came can use")
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.delegate = self
            present(ipc, animated: true, completion: nil)
            <#code#>
        } else {
            print("camera is not available")
        }
    }
    
    @IBAction func ShareAction(_ sender: Any) {
        if let sharedImage = photoImage.image {
            let sharedItems = [sharedImage]
            let controller = UIActivityViewController(activityItems: sharedItems, applicationActivities: nil)
            controller.popoverPresentationController?.sourceView=view
            present(controller, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        photoImage.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
}

