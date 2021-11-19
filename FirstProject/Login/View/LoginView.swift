//
//  LoginView.swift
//  FirstProject
//
//  Created by rvaidya on 17/11/21.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var didAgree = false
    @State private var didLogin = false
    @State private var animateAirPlane = false
    @State private var showHomeScreen = false
    @State private var validPwd = true
    @State private var validUsn = true
    @State private var showTCAlert = false
    
    let height = UIScreen.main.bounds.height
    let vmFactory = ViewModelFactory()

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image(systemName: "airplane")
                    .resizable()
                    .foregroundColor(.indigo.opacity(0.9))
                    .frame(width: 50, height: 50, alignment: .center)
                    .rotationEffect(.degrees(-90))
                    .padding()
                    .offset(y: animateAirPlane ? -height/2 : 0)
                    .transition(animateAirPlane ? .asymmetric(insertion: .identity, removal: .move(edge: .top)) : .identity)
                    .animation(animateAirPlane ? .easeOut(duration: 1) : .none)
                VStack {
                    TextField("Username", text: $username, prompt: Text("Username"))
                        .modifier(CustomTextField())
                    if !validUsn {
                        Text("* Username must be atleast 8 characters long & cannot have any special characters. ")
                            .font(.footnote)
                            .foregroundColor(.red)
//                            .frame(width: 250, height: 50, alignment: .center)

                    }
                    TextField("Password", text: $password, prompt: Text("Password"))
                        .modifier(CustomTextField())
                    if !validPwd {
                        Text("* Password must be atleast 8 characters long & should contain uppercase, lowercase & special characters")
                            .font(.footnote)

                            .foregroundColor(.red)
//                            .frame(width: 250, height: 50, alignment: .center)

                    }
                }
                .padding()

                termsAndConditionsView
                
                loginBtn
              
                Spacer()

                NavigationLink(isActive: $showHomeScreen) {
                    ContentView(homeDataObserver: vmFactory.getHomeViewModel())
                } label: {
                    EmptyView()
                }
            }
            .alert(isPresented: $showTCAlert, content: {
                Alert(title: Text("T & C"), message: Text("Please accept T & C to proceed"), dismissButton: .cancel(Text("OK")))
            })
        }
        .navigationViewStyle(.stack)
    }
    
    var shouldTryLogin: Bool {
        return !username.isEmpty && !password.isEmpty
    }
    
    var loginBtn: some View {
        Button {
            if shouldTryLogin && didAgree {
                validateCredentials()
            }
            else if !didAgree {
                showTCAlert = true
            }
        } label: {
            if didLogin {
                ProgressView()
                Text("Loging you in...")
                    .onAppear {
                        animatePlane()
                    }
            }
            else {
                Text("Login")
                    .fontWeight(.regular)
            }
        }
        .buttonStyle(.plain)
        .padding()
        .background(Color.indigo.opacity(0.6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 12)
       
    }
    
    var termsAndConditionsView: some View {
        
        HStack {
            Button {
                didAgree.toggle()
                
            } label: {
                ZStack {
                    Image(systemName: "square")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                    if didAgree {
                        Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 15, height: 15, alignment: .center)

                    }
                }
            }
            .frame(width: 30, height: 30, alignment: .center)
            .buttonStyle(.plain)
            Text("I agree to the terms & conditions")

        }
        .padding()
    }
    
    func validateCredentials() {
        
        let alphanumerics = CharacterSet.alphanumerics
        let uppercaseLetters = CharacterSet.uppercaseLetters
        let lowercaseLetters = CharacterSet.lowercaseLetters
//        let specialCharacters: CharacterSet = ["&", "*", "@"]
        
        
        let passwordContent = (password.rangeOfCharacter(from: uppercaseLetters) != nil) && (password.rangeOfCharacter(from: lowercaseLetters) != nil )
        validPwd = passwordContent && password.count >= 8
        
        let usnContent = (username.rangeOfCharacter(from: alphanumerics) != nil)
        validUsn = usnContent && username.count >= 8
        
        if !validPwd || !validUsn {
            didLogin = false
        }
        else {
            didLogin = true
        }
        
    }
    
    func animatePlane() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            animateAirPlane = true
            didLogin = false
        })

        DispatchQueue.main.asyncAfter(deadline: .now() + 6.2) {
            showHomeScreen = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}


