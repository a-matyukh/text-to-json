import Foundation
import llmfarm_core

public func generate_steps(from: String) -> Steps {
    
    print("Get this subtitles:")
    print(from)
    
    do {
        let generated_json = """
        {"steps": [{"step_name": "wau","step_description": "camon"}]}
        """.data(using: .utf8)!
        
        let decodedSteps = try JSONDecoder().decode(Steps.self, from: generated_json)
        print(decodedSteps)
        return decodedSteps
    } catch {
        print("Check out failed: \(error.localizedDescription)")
    }

    let step = Step(step_name: "Something went wrong", step_description: "Try again")
    return Steps(steps: [step])
    
}

public struct Steps: Codable {
    public let steps: [Step]
}
public struct Step: Codable {
    public let step_name: String
    public let step_description: String
}
