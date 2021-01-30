//
//  PeerMagic.swift
//  OldMaid
//
//  Created by Larry Mcdowell on 1/30/21.
//
/*
//https://medium.com/apple-developer-academy-federico-ii/multipeerconnectivity-swiftui-5faa62a611a9

//https://www.hackingwithswift.com/example-code/networking/how-to-create-a-peer-to-peer-network-using-the-multipeer-connectivity-framework
 */
import Foundation

import MultipeerConnectivity

protocol PeerMagicDelegate {
    func connectedDevicesChanged(manager : PeerMagic, connectedDevices: [String])
    
    func colorChanged(manager : PeerMagic, colorString: String)
    
}

class PeerMagic: NSObject, MCNearbyServiceAdvertiserDelegate, MCNearbyServiceBrowserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        <#code#>
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        <#code#>
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        <#code#>
    }
    
    
    private let myPeerId = MCPeerID(displayName: UIDevice.current.name)
    
    private let serviceAdvertiser : MCNearbyServiceAdvertiser
    private let serviceBrowser : MCNearbyServiceBrowser
    
    private let nateService = "my Service Type"
    
    var delegate : PeerMagicDelegate?
    
    lazy var session : MCSession = {
        let session = MCSession(peer: self.myPeerId, securityIdentity: nil, encryptionPreference: .required)
        
        session.delegate = self
        
        return session
        
    }()
    
    override init() {
        self.serviceAdvertiser = MCNearbyServiceAdvertiser(peer: myPeerId, discoveryInfo: nil, serviceType: nateService)
        
        self.serviceBrowser = MCNearbyServiceBrowser(peer: myPeerId, serviceType: nateService)
        
        super.init()
        
        self.serviceAdvertiser.delegate = self
        
        self.serviceAdvertiser.startAdvertisingPeer()
        
        self.serviceBrowser.delegate = self
        
        self.serviceBrowser.startBrowsingForPeers()}
    
}
