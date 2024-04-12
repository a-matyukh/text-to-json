public func generate_steps(from: String) -> String {
    
    print("Get this subtitles:")
    print(from)
    
    let generated_json = """
    {steps: [{"step_name": "wau","step_description": "camon"}]}
    """
    
    return generated_json
    
}

struct Steps: Codable {
    let steps: [Step]
}
struct Step: Codable {
    let step_name: String
    let step_description: String
}
