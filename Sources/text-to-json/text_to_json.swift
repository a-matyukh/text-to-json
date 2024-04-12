import Foundation
import llmfarm_core

let maxOutputLength = 256
var total_output = 0

func mainCallback(_ str: String, _ time: Double) -> Bool {
    print("\(str)",terminator: "")
    total_output += str.count
    if(total_output>maxOutputLength) {
        return true
    }
    return false
}

public func generate_steps(from: String, modelPath: String, grammarPath: String) -> [GeneratedStep] {
    
    let ai = AI(_modelPath: modelPath, _chatName: "chat")
    
    var params:ModelAndContextParams = .default
    params.promptFormat = .Custom
    params.custom_prompt_format = """
    SYSTEM: Create step-by-step instructions from user prompt.
    USER: {prompt}
    ASSISTANT:
    """
    params.use_metal = true
    params.grammar_path = grammarPath

    _ = try? ai.loadModel_sync(ModelInference.LLama_gguf,contextParams: params)

    let output = try? ai.model.predict(from, mainCallback)
    
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
