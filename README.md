# untitled

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



ASYNC AWAIT

Certainly! In Flutter, the concepts of Future, async, and await are related to asynchronous programming, which allows you to perform tasks concurrently without blocking the execution of your app.
Here's a simple explanation of these concepts:
1. Future: A Future represents a value or an error that may not be available immediately. It is used to represent an asynchronous operation that will complete sometime in the future. You can think of it as a placeholder for a value that will be available later.
2. async: The async keyword is used to mark a function as asynchronous. When a function is marked as async, it means that it may contain await expressions and can return a Future or use other asynchronous operations.
3. await: The await keyword is used to pause the execution of an async function until a Future completes and returns a value. When you await a Future, it allows the function to wait for the result of the Future before proceeding further. It essentially allows you to write asynchronous code that looks and behaves like synchronous code.
   Here's a simple example to illustrate the usage of async, await, and Future:

Future<int> fetchData() async {
await Future.delayed(Duration(seconds: 2)); // Simulating an asynchronous operation
return 42;
}

void main() async {
print('Before fetching data');

int result = await fetchData();
print('Fetched data: $result');

print('After fetching data');
}
In this example, fetchData is an asynchronous function that returns a Future<int>. Inside the function, we simulate an asynchronous operation by using Future.delayed to pause for 2 seconds before returning the value 42. The await keyword is used to pause the execution of the main function until the fetchData Future completes and returns a value.

When you run the code, you will see the following output:
In this example, the fetchData method makes a GET request to a specified URL using the http package. If the response is successful (status code 200), the response body is parsed as JSON and the list of items is updated. The ListView.builder widget is used to dynamically build the list items based on the length of the items list.
Note that you should replace 'https://example.com/api/data' with the actual URL of the API you want to fetch data from.
Finally, you can use the MyListView widget in your app by adding it to your widget tree. For example, you can use it as the home property of a MaterialApp:

As you can see, the execution of the main function is not blocked while waiting for the fetchData operation to complete. Instead, it continues executing other tasks until the awaited Future completes, and then it resumes execution at the point where it left off.

In summary, Future, async, and await are used in Flutter for handling asynchronous operations. Future represents a value that may not be available immediately, async marks a function as asynchronous, and await pauses the execution of an asynchronous function until a Future completes. These concepts allow you to write asynchronous code in a more readable and synchronous-like manner.


DYNAMIC

In Dart, dynamic is a type that represents a value of any type. When a variable is declared as dynamic, it means that its type can be changed dynamically at runtime. The Dart runtime does not enforce type checks on dynamic variables, allowing them to hold values of different types throughout the execution of the program.
Here's an example to illustrate the usage of dynamic:

void main() {
dynamic value = 10; // value is initially an integer
print(value); // Output: 10

value = 'Hello'; // value is now a string
print(value); // Output: Hello

value = true; // value is now a boolean
print(value); // Output: true
}


In the example, the variable value is declared as dynamic. Initially, it is assigned an integer value (10), and later it is assigned a string value ('Hello'), and finally a boolean value (true). The Dart runtime allows this flexibility because the type of value is not statically enforced.
While using dynamic provides flexibility, it also bypasses static type checking and can lead to potential runtime errors if not used carefully. It is generally recommended to use dynamic sparingly and opt for static typing whenever possible, as it helps catch type-related errors at compile-time and improves code readability and maintainability.
In cases where you need to work with values of different types without explicitly defining their types, or when dealing with external dynamic data such as JSON or external APIs, dynamic can be useful. However, it's important to exercise caution and ensure proper type checks and handling to avoid unexpected errors.

Future<List<Student>> fetchStudents() async {
final url = Uri.parse('api/getstudents');

final response = await http.get(url);

if (response.statusCode == 200) {
final List<dynamic> jsonData = jsonDecode(response.body);

    List<Student> students = jsonData.map((data) => Student.fromJson(data)).toList();
    
    return students;
} else {
throw Exception('Failed to fetch students');
}
}

