import SwiftUI

struct QuizView2: View {
    @State private var selectedAnswer: String? = nil
    @State private var showResult = false
    @State private var isCorrect = false
    @State private var showDarkScreen = false

    var body: some View {
        ZStack {
            VStack {
                // Question
                Text("Which layer of the Earth's atmosphere contains the ozone layer?")
                    .font(.title)
                    .fontWeight(.bold)
//                    .padding(.top, 20)
                    .padding()

                // Choices
                VStack(alignment: .leading, spacing: 10) {
                    Button(action: { checkAnswer("A") }) {
                        Text("A) Troposphere")
                            .padding()
                            .fontWeight(.semibold)
                            .background(selectedAnswer == "A" ? Color.gray.opacity(0.3) : Color.red.opacity(0.9))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }

                    Button(action: { checkAnswer("B") }) {
                        Text("B) Stratosphere")
                            .padding()
                            .fontWeight(.semibold)
                            .background(selectedAnswer == "B" ? Color.gray.opacity(0.3) : Color.yellow)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }

                    Button(action: { checkAnswer("C") }) {
                        Text("C) Mesosphere")
                            .padding()
                            .fontWeight(.semibold)
                            .background(selectedAnswer == "C" ? Color.gray.opacity(0.3) : Color.blue)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }

                    Button(action: { checkAnswer("D") }) {
                        Text("D) Thermosphere")
                            .padding()
                            .fontWeight(.semibold)
                            .background(selectedAnswer == "D" ? Color.gray.opacity(0.3) : Color.purple)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 20)
            }

            // Dark screen with system image when a choice is selected
            if showDarkScreen {
                Color.black.opacity(0.7)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            Image(systemName: isCorrect ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(isCorrect ? .green : .red)

                            Text(isCorrect ? "Correct!" : "Wrong!")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding(.top, 20)
// 
//                            Button("Dismiss") {
//                                showDarkScreen = false
//                                selectedAnswer = nil
//                            }
//                            .padding()
//                            .background(Color.white)
//                            .cornerRadius(10)
//                            .foregroundColor(.black)
//                            .padding(.top, 20)
                        }
                    )
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: showDarkScreen)
    }

    func checkAnswer(_ answer: String) {
        selectedAnswer = answer

        // Correct answer is B
        if answer == "B" {
            isCorrect = true
        } else {
            isCorrect = false
        }

        // Show the dark screen with result
        withAnimation {
            showDarkScreen = true
        }

        // Dismiss after a brief delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showDarkScreen = false
        }
    }
}

#Preview {
    QuizView2()
}

