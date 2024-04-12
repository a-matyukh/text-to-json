import Foundation
import llmfarm_core

public func generate_steps(from: String, modelPath: String, grammarPath: String) -> [GeneratedStep] {
    
    print("Get this subtitles:")
    print(from)
    
    print(modelPath)
    let ai = AI(_modelPath: modelPath, _chatName: "chat")
    print(ai)
//    print(grammarPath)
    
    
    do {
        let generated_json = """
        {"steps": [{"step_name": "Fake step","step_description": "Fake description"}]}
        """.data(using: .utf8)!
        let decodedSteps = try JSONDecoder().decode(StepsJSON.self, from: generated_json)
        return decodedSteps.steps
    } catch {
        print("Decode failed: \(error.localizedDescription)")
    }

    return [GeneratedStep(step_name: "Something went wrong", step_description: "Try again")]
    
}

public struct StepsJSON: Codable {
    public let steps: [GeneratedStep]
}
public struct GeneratedStep: Codable {
    public let step_name: String
    public let step_description: String
}
