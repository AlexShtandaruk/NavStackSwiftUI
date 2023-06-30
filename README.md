# NavigationStack

A description of this package.
1. Add SwiftUI via PackageManager

2. Add import to your files

```swift
import NavigationStack
```

3. Cover your screens NavigationContainerView instead of NavigationView(content: )

```swift 
NavigationContainerView(transition: .custom(.scale)) { ExampleScreen() }
```

4. Add method toAnyView() for Views

```swift
extension View {
    
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
```

5. Call navigation methods of routerModel to make a magic:

```swift
struct ExampleScreen: View {

    @EnvironmentObject var routerModel: NavigationContainerViewModel

    var body: some View {
        Text("Back")
            .onTapGesture {
                  routerModel.push(screenView: CategoryDetailScreen(data: category).toAnyView())
            }
    }
}
```

6. To return to previous screen:
   
```swift
routerModel.pop()
```

7. To return to root:
   
```swift
routerModel.popToRoot()
```
