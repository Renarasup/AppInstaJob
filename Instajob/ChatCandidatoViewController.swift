//
//  ChatViewController.swift
//  testPersistencia
//
//  Created by Diego Crozare on 18/11/17.
//  Copyright © 2017 Diego William Crozare. All rights reserved.
//

import UIKit
import JSQMessagesViewController
import MobileCoreServices
import AVKit
import FirebaseDatabase
import FirebaseAuth

class ChatCandidatoViewController: JSQMessagesViewController {
    
    
    var messages:[JSQMessage] = []
    var docRef: DatabaseReference!
    var idCandidato = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.senderId = "2"
        self.senderDisplayName = "Gustavo"
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        observeMessages()
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        let imageFactory = JSQMessagesBubbleImageFactory()
        //let message =   messages[indexPath.item]
        return imageFactory?.outgoingMessagesBubbleImage(with: UIColor.blue)
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        return JSQMessagesAvatarImageFactory.avatarImage(with: UIImage(named: "foto3x4"), diameter: 30)
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!, messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath) as! JSQMessagesCollectionViewCell
        return cell
        
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
//        messages.append(JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text))
//        collectionView.reloadData()
        addMessage(withId: senderId, displayName: senderDisplayName, text: text)
        let msg = ["senderId": senderId!, "senderDisplayName": senderDisplayName!, "mensagem" : text!]
        docRef = Database.database().reference()
        docRef.child("mensagem").child(self.idCandidato!).setValue(msg)
        
        finishSendingMessage()
    }
    
    private func addMessage(withId senderId: String, displayName: String, text: String) {
        if let message = JSQMessage(senderId: senderId, displayName: senderDisplayName, text: text) {
            messages.append(message)
        }
    }
    
    private func observeMessages() {
        self.docRef = Database.database().reference()

        docRef.child("mensagem").observe(DataEventType.childAdded, with: { (snapshot) -> Void in

            if let messageData = snapshot.value as? NSDictionary{
                let id = messageData["senderId"] as? String
                let name = messageData["senderDisplayName"] as? String
                let text = messageData["mensagem"] as? String
                self.addMessage(withId: id!, displayName: name!, text: text!)
            }
//                self.finishReceivingMessage()
        })
    }
    deinit {
        self.docRef.child("mensagem").removeAllObservers()
    }
}

