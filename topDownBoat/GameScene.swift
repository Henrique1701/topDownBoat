//
//  GameScene.swift
//  topDownBoat
//
//  Created by José Henrique Fernandes Silva on 18/06/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var boat: SKSpriteNode?
    var lastPosition: CGPoint = CGPoint(x: 0, y: 0)
    
    override func didMove(to view: SKView) {
        // Muda a cor do fundo
        self.backgroundColor = .systemBlue
        
        // Configura o tamanho do bote
        var size = CGSize()
        let percentage = self.frame.height * 0.1
        size.width = 133 * (percentage / 100)
        size.height = 103 * (percentage / 100)
        
        // Configura e adiciona o bote
        self.boat = SKSpriteNode(imageNamed: "boat")
        self.boat?.size = size
        self.boat!.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.addChild(boat!)
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            // Pega a nova posição:
            let location = t.location(in: self)
            let newX = self.lastPosition.x + location.x
            let newY = self.lastPosition.y + location.y
            let newPosition = CGPoint(x: newX, y: newY)
            
            // Cria e adiciona ação para mover
            let move = SKAction.move(to: newPosition, duration: 2.5)
            self.boat!.run(move)
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.lastPosition = self.boat!.position
    }
}
