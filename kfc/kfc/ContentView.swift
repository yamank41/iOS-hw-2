//
//  ContentView.swift
//  kfc
//
//  Created by Yaman Koujan on 15/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State var num1 = 0
    @State var num2 = 0
    @State var num3 = 0
    @State var num4 = 0
    @State var num5 = 0
    @State var type = ""
    @State var total = 0.0
    @State var message = ""
    var body: some View {
        
        ZStack{
            Image("cod")
            .resizable()
            .ignoresSafeArea()
           Image("l")
                .resizable()
                .padding(.top, 230.0)
                .frame(width: 430.0, height: 800.0 )
                .clipShape(RoundedRectangle(cornerRadius: 60))
                
            
            
                
            VStack{
               Text("Menu")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .padding(.top, 175)
                    
                HStack{
                    Stepper("تويستر 0.850د.ك ", value: $num1 )
                    Text("\(num1)")
                    
                }.padding()
                HStack{
                    Stepper("بيج فيار 1.200د.ك ", value: $num2 )
                    Text("\(num2)")
                    
                }.padding()
                HStack{
                    Stepper("مايتي زنجر 1.200د.ك ", value: $num3 )
                    Text("\(num3)")
                    
                }.padding()
                HStack{
                    Stepper("بطاطا 0.500د.ك ", value: $num4 )
                    Text("\(num4)")
                    
                }.padding()
                HStack{
                    Stepper("كولا 0.500د.ك ", value: $num5 )
                    Text("\(num5)")
                    
                }.padding()
                HStack{
                    TextField("المبلغ" , text: $type)
                    Text("أدخل المبلغ هنا")
                }.padding(.horizontal,100)
               
                Text("اضغط لمعرفة الفاتورة")
                    .foregroundColor(Color.white)
                    .padding()
                    .background(.black)
                    .onTapGesture {
                        var price1 = (Double(num1) ?? 0) * 0.850
                        var price2 = (Double(num2) ?? 0)  * 1.200
                        var price3 = (Double(num3) ?? 0)  * 1.200
                        var price4 = (Double(num4) ?? 0)  * 0.500
                        var price5 = (Double(num5) ?? 0)  * 0.500
                        total = price1 + price2 + price3 + price4 + price5
                        if total <= Double(type) ?? 0 {
                        message = "تمت العملية بنجاح"
                        }
                        else if Double(type) == 0{
                            message = "عفوا ادخل المبلغ الذي لديك"
                        }
                        else {
                            message = "عفوا لا يوجد مال كافي لاتمام العملية"
                        }
                     }
                Text(" المبلغ الاجمالي \(total, specifier: "%.2f") ")
               
                Text(message)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
