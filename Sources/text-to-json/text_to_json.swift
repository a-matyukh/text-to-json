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
    
    print("Get this subtitles:")
    print(from)
    
    print(modelPath)
    let ai = AI(_modelPath: modelPath, _chatName: "chat")
    
    var params:ModelAndContextParams = .default
    params.promptFormat = .Custom
    params.custom_prompt_format = """
    SYSTEM: You are a helpful, respectful and honest assistant.
    USER: {prompt}
    ASSISTANT:
    """
    var input_text = "State the meaning of life"
    params.use_metal = true

    _ = try? ai.loadModel_sync(ModelInference.LLama_gguf,contextParams: params)

    let output = try? ai.model.predict(input_text, mainCallback)
    
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
