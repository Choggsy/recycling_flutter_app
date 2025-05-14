# Coding Standards for Dart/Flutter Recycling Prototype

## 1. Naming Conventions

- **Classes**: Use `UpperCamelCase` for class names.
  ```dart
  class PlasticCounterClass {}
  ```

- **Variables**: Use `LowerCamelCase` for variable names.
  ```dart
  var variableLocationName;
  ```

- **Constants**: Use `LowerCamelCase` for constant names
  ```dart
  const int maxIntCount = 10;
  ```

- **Functions**: Use `LowerCamelCase` for function names
  ```dart
  void myRecyclingFunction() {}
  ```

- **File Names**: Use `SnakeCase` for file names
  ```dart
  my_recycling_file.dart
  ```

- **Directory Names**: Use `SnakeCase` for file names

## 2. Clean Code Practices

- **Avoid Deep Nesting**: Keep nesting levels to a minimum to improve _readability_
  ```dart
    // Avoid
    if (condition) {
      if (anotherCondition) {
        // code
      }
    }
    
    // Preferred
    if (condition && anotherCondition) {
      // code
    }
  ```
- **Use Meaningful Names**: Choose descriptive and meaningful names when naming anything. This will reduce the need for comments
 ```dart
  // Avoid
  var x;
  
  // Preferred
  var cardboardCounter;
  ```
- **Minimal Wise Comments**: If comments are required, explain _why_ not _what_ is happening
```dart
  /* Avoid
  Increment i by 1
  */
  i++;

  /*Preferred
  Increment index to account for zero-based indexing
   */
  i++; 
```

- **Avoid Magic Numbers**: Use named constants instead of magic numbers to make code more understandable.
 ```dart
    // Avoid
  if(count > 18) {
    // code
  }
  
  // Preferred
  const int cardboardCounter = 18;
  if (count > cardboardCounter) {
  // code
  }
  ```
## 3. Flutter Specific Practices
- **Widget Structuring**: Break down large widgets into smaller, reusable widgets.
 ```dart
  // Avoid
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Title'),
        Text('Subtitle'),
      ],
    );
  }
  
  // Preferred
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(),
        SubtitleWidget(),
      ],
    );
  }
  ```
- **State Management**: Use a state management solution that's appropriate for the app's complexity (Options: Provider, Riverpod, Bloc).

- **Avoid Rebuilding Unnecessary Widgets**: Use _const constructors_ and _const widgets_ where possible to avoid unnecessary rebuilds.

## References 
- **Dart Team. (2024).** _Effective Dart: Documentation._ [online] Available at: https://dart.dev/effective-dart/documentation [Accessed 16 Apr. 2025].
- **Dart Team. (2024).** _Effective Dart: Style._ [online] Available at: https://dart.dev/effective-dart/style [Accessed 16 Apr. 2025].
- **Dart Team. (2024).** _Effective Dart: Usage._ [online] Available at: https://dart.dev/effective-dart/usage [Accessed 17 Apr. 2025].
