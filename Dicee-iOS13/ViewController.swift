import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewDiceO: UIImageView!
    @IBOutlet weak var viewDice1: UIImageView!
    @IBOutlet weak var viewDice2: UIImageView!
    @IBOutlet weak var viewDice3: UIImageView!
    @IBOutlet weak var viewDice4: UIImageView!
    @IBOutlet weak var game: UITextView!
    
    func isGame(gameValue: [Int]){
        let sortedValues = gameValue.sorted() // Sort the values
        let uniqueValues = Set(gameValue) // Create a set to check unique values
        var combination: String = "NO HAY JUEGO"
        // Generala: 5 identical values
        if uniqueValues.count == 1 {
            combination = "GENERALA"
            game.text = combination
            print("GENERALA")
            return
        }
        
        // Poker: 4 identical values
        if uniqueValues.count == 2, gameValue.filter({ $0 == gameValue[0] }).count == 4 || gameValue.filter({ $0 == gameValue[1] }).count == 4 {
            combination = "POKER"
            game.text = combination
            print("Poker")
            return
        }
        
        // Full: 3 identical values and 2 identical values of another number
        if uniqueValues.count == 2, gameValue.filter({ $0 == gameValue[0] }).count == 3 || gameValue.filter({ $0 == gameValue[0] }).count == 2 {
            combination = "FULL"
            game.text = combination
            print("Full")
            return
        }
        
        // Escalera: 1-2-3-4-5, 2-3-4-5-6, or 3-4-5-6-1
        if sortedValues == [1, 2, 3, 4, 5] ||
           sortedValues == [2, 3, 4, 5, 6] ||
           sortedValues == [1, 3, 4, 5, 6] {
           combination = "ESCALERA"
           game.text = combination
           print("Straight")
           return
            
        }

        game.text = combination
        
       print(gameValue)
        
    }
    
    
    
    
    func rolling() {
        let imagesResources = [
            UIImage(imageLiteralResourceName: "DiceOne"),
            UIImage(imageLiteralResourceName: "DiceTwo"),
            UIImage(imageLiteralResourceName: "DiceThree"),
            UIImage(imageLiteralResourceName: "DiceFour"),
            UIImage(imageLiteralResourceName: "DiceFive"),
            UIImage(imageLiteralResourceName: "DiceSix")
        ]
        
               
        let views:[UIImageView] = [viewDiceO, viewDice1, viewDice2, viewDice3,viewDice4]
        
        var randomValues:[Int] = []
        for _ in 0...5 {
            randomValues.append(Int.random(in: 0...5))
        }
     
        var result:[Int] = []
       
        for diceView in views {
            let randomValue = randomValues.randomElement()
            let randomImg = imagesResources[randomValue!]
            diceView.image = randomImg
            result.append(randomValue! + 1)
            
        }
        isGame(gameValue: result)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game.text = "Toca en el botón para lanzar los dados"
    }
    
    @IBAction func rollingDiceAction(_ sender: UIButton) {
        rolling()
    }
}
