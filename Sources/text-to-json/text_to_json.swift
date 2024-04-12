public func generate_steps(from: String) -> String {
    
    print("Get this subtitles:")
    print(from)
    
    let generated_json = """
    {steps: [{"step_name": "wau","step_description": "camon"}]}
    """
    
    return generated_json
    
}

public struct Steps: Codable {
    public let steps: [Step]
}
public struct Step: Codable {
    public let step_name: String
    public let step_description: String
}
