//
//  CheckoutView.swift
//  iDine
//
//  Created by Elliot Knight on 26/01/2022.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    static let tipAmounts = [10, 15, 25, 50, 0]
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    
    @State private var showAlert = false
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay ?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
                VStack(alignment: .leading) {
                    Section(header: Text("Add a tip ?")) {
                        Picker("Percentage:", selection: $tipAmount) {
                            ForEach(0..<Self.tipAmounts.count, id: \.self) {
                                Text("\(Self.tipAmounts[$0])%")
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                    }
                }
                Section(header: Text("TOTAL: $\(totalPrice.formatted())")) {
                    Button("Confirm order") {
                        self.showAlert.toggle()
                        
                    }
                }
            }
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $showAlert) {
            Button("OK") {}
        }message: {
            Text("Your total was $\(totalPrice.formatted()), thank you !")
        }
    }
}
    
    struct CheckoutView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                CheckoutView()
                    .environmentObject(Order())
            }
        }
    }
