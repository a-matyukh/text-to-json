import Foundation
import llmfarm_core

public func generate_steps(from: String) -> [GeneratedStep] {
    
    print("Get this subtitles:")
    print(from)
    
    do {
        let generated_json = """
        {"steps": [{"step_name": "Fake step","step_description": "Fake description"}]}
        """.data(using: .utf8)!
        let decodedSteps = try JSONDecoder().decode(StepsJSON.self, from: generated_json)
        return decodedSteps.steps
    } catch {
        print("Check out failed: \(error.localizedDescription)")
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
