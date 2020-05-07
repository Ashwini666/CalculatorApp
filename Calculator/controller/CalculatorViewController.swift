//
//  ViewController.swift
//  Calculator
//
//  Created by Neosoft on 30/04/20.
//  Copyright © 2020 webwerks. All rights reserved.
//

import UIKit



class CalculatorViewController: UIViewController {
    
    // MARK:- Outlets
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var myMainView: UIView!
    @IBOutlet weak var display: UIView!
    @IBOutlet var clearEqualButton: [UIButton]!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var parentSatckView: UIStackView!
    @IBOutlet var operationBtn: [UIButton]!
    @IBOutlet var numberBtns: [UIButton]!
    
    @IBOutlet weak var lblDisplayTxt: UILabel!
    // MARK:- Properties
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperator : Operation = .Empty
    
    
    // MARK:- view cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetUp()
        setButtons()
    }
    
    
   
    
    // MARK:- Ui intialise
    
    private func uiSetUp(){
        numberLabel.text = ""
        lblDisplayTxt.text = ""
        self.navigationItem.title = AppTitle
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor.myBrown
        navigationBarAppearance.isTranslucent = false //for making color exact same
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white , NSAttributedString.Key.font: UIFont(name: "Georgia-Bold", size: 21)!]
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        statusBarView.backgroundColor = UIColor.myBrown
        view.addSubview(statusBarView)
        myMainView.backgroundColor = UIColor.myLightBlack
        parentSatckView.backgroundColor = UIColor.myLightBlack
        display.backgroundColor = UIColor.display
        display.layer.cornerRadius = 10
    }
    
    // MARK:- set button  properties
    private func setButtons(){
        numberBtns.forEach { (btn) in
            btn.setBtnProperties(bgColor: UIColor.numbers, borderColor: UIColor.buttonBorder, titleColor: UIColor.textColor)
        }
        
        clearEqualButton.forEach { (btn) in
            btn.setBtnProperties(bgColor: UIColor.myBrown, borderColor: UIColor.buttonBorder, titleColor: UIColor.white)
        }
        
        operationBtn.forEach { (btn) in
            btn.setBtnProperties(bgColor: UIColor.symbols, borderColor: UIColor.buttonBorder, titleColor: UIColor.white)
        }
    }
    
    private func claerAll(){
        runningNumber = ""
        lblDisplayTxt.text = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperator = .Empty
        numberLabel.text = ""
    }
    
    // MARK:- Clear All things
    @IBAction func clearEqualsPressed(_ sender: Any) {
        claerAll()
    }
    
    // MARK:- Number clicked action

    @IBAction func numberPressed(_ sender: UIButton) {
         numberLabel.text = ""
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag - 1)"
            //numberLabel.text = runningNumber
        }
        guard let temp = Double(runningNumber) else {return}
        //Apply num formatter
       // numberLabel.text = NumberFormatter().numFormatter(temp: temp)
        if lblDisplayTxt.text == ""{
            lblDisplayTxt.text = NumberFormatter().numFormatter(temp: temp)
            
        }else{
            lblDisplayTxt.text! += "\(sender.tag - 1)"
        }

    }
    
    // MARK:- +ve/-ve clicked action
    
    @IBAction func plusMinusBtn(_ sender: UIButton) {
        guard let temp = Int(runningNumber) else {return}
        runningNumber = "\(temp * (-1))"
        //numberLabel.text = runningNumber
        lblDisplayTxt.text = runningNumber

    }
    // MARK:- dot btn action

    @IBAction func dotPressed(_ sender: UIButton) {
        if runningNumber.count <= 7{
            runningNumber += "."
           // numberLabel.text = runningNumber
            lblDisplayTxt.text = runningNumber
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        numberLabel.text = runningNumber
        if runningNumber.count != 0 {
            runningNumber.removeLast()

        }else{
            claerAll()
        }
        
    }
    
    // MARK:- Equal to Action

    @IBAction func equalsToo(_ sender: UIButton) {
        operation(operation: currentOperator)
    }
    
    // MARK:- Performopertion

    @IBAction func operationPerformed(_ sender: UIButton) {
        if sender.tag == 11{ // add opertion

            operation(operation: .Add)
            lblDisplayTxt.text = "\(leftValue)" + "+"
            

        }
        if sender.tag == 12{ // sub
            operation(operation: .Substract)
            lblDisplayTxt.text = "\(leftValue)" + "_"

        }
        if sender.tag == 14{ // division

            operation(operation: .Division)
            lblDisplayTxt.text = "\(leftValue)" +  "/"

        }
        if sender.tag == 13{ // multiply

            operation(operation: .Multiply)
            lblDisplayTxt.text = "\(leftValue)" +  "*"

        }
        if sender.tag == 15 {
            numberLabel.text = runningNumber
            if let tempNum = Double(result){
                runningNumber = "\(tempNum / 100 )"
                
            }
        }
        numberLabel.text = ""
    }
    
    // MARK:- perform Opertion
    
    func operation (operation : Operation){

        if currentOperator != .Empty{
            if runningNumber != ""{
                rightValue = runningNumber
                runningNumber = ""
                var numFirst  = 0.0
                var numSecond = 0.0
                
                if let left = Double(leftValue), let right = Double(rightValue){
                    numFirst = left
                    numSecond = right
                }
                if currentOperator == .Add{
                    result =  String(numFirst + numSecond)

                }else if currentOperator == .Substract{
                    result =  String(numFirst - numSecond)
                    
                }else if currentOperator == .Division{
                    result =  String(numFirst / numSecond)
                    
                }else if currentOperator == .Multiply{
                    result =  String(numFirst * numSecond)
                }else{

                }
                
                leftValue = result
                numberLabel.text =  "=" + "\(result)"
            }
            currentOperator = operation
            
        }else {
            leftValue = runningNumber
            
            runningNumber = ""
            currentOperator = operation
        }
    }
    
    
}



