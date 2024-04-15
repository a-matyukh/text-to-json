Usage example

```swift
import text_to_json

let subtitles = "Hi, today I'm going to show you how to turn on your air conditioner if you don't have a remote control. So if your air conditioner looks similar to this one, all you have to do is try to pop up this panel over here, like pulling this side and also the other side. Okay, so once you do that, try not to open this more because this is like the maximum that it can go, so try not to rip it off. So right now, once we open it here on the right side of the air conditioner as you see there we have Some button So right now it's set up to be on remote control, which is the last option there. So if we just push this up twice You already heard it air conditioner beeped so right now it turned on and it's blowing fresh air so this is how we turn on your air conditioner without remote thanks for watching. Bye."
let modelPath = Bundle.main.path(forResource: "mistral-7b-instruct-v0.2.Q2_K" , ofType: "gguf")!
let grammarPath = Bundle.main.path(forResource: "steps" , ofType: "gbnf")!
let generated_steps = generate_steps(from: subtitles, modelPath: modelPath, grammarPath: grammarPath)
```
