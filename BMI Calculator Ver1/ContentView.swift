//
//  ContentView.swift
//  BMI Calculator Ver1
//
//  Created by Kobby on 24/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var bmiValue: Double = 0.0
    @State private var bmiMessage: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("BMI Calculator Ver1")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.center)
                    .padding(.all)
                
                TextField("Enter Height (m)", text: $height)
                    .keyboardType(.decimalPad)
                    .padding()
                
                TextField("Enter Height (m)", text: $weight)
                    .keyboardType(.decimalPad)
                    .padding()
                
                Button(action: calculateBMI){
                    Text("Calculate BMI")
                }
                .padding()
                
                Text("BMI: \(String(format: "%.2f", bmiValue))")
                    .font(.headline)
                    .padding(.all)
                
                Text(bmiMessage)
                    .font(.subheadline)
                    .padding()
                
                Spacer()
                
            }
            .padding()
            .alert(isPresented: $showAlert){
                Alert(title: Text("Invalid Data"), message: Text("Non-numeric Data"), dismissButton: .default(Text("Try Again")))
            }
        }
        .background(Color.mint)
    }
    
    func calculateBMI(){
        if let heightValue = Double(height), let weightValue = Double(weight), heightValue > 0, weightValue > 0 {
            let bmi = weightValue / (heightValue * heightValue)
            bmiValue = bmi
            
            
            if bmi < 18.5 {
                bmiMessage = "Underweight"
            } else if bmi < 24.9 {
                bmiMessage = "Normal Weight"
            } else if bmi < 29.9 {
                bmiMessage = "Overweight"
            } else{
                bmiMessage = "Obese"
            }
            
        }
        else {
            bmiValue = 0
            bmiMessage = "Please enter valid values "
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
