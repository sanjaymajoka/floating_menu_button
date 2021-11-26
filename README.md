<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->


A Package helps to create Floating Menu to show list of menu items.

# Example

```
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FloatingMenuWidget(
        menuItems: [
          MenuItems(id: "1", value: "Item 1"),
          MenuItems(id: "2", value: "Item 2"),
          MenuItems(id: "3", value: "Item 3")
        ],
        onItemSelection: (menuItems){
          final snackBar = SnackBar(content: Text("${menuItems.value} Clicked"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },

        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}
```
On Close

![Screenshot_1637825923](https://user-images.githubusercontent.com/24270217/143525572-e973cd77-8c04-4759-9981-1a92917d926c.png)

On Open

![Screenshot_1637825916](https://user-images.githubusercontent.com/24270217/143525644-3a0f5db7-b1cd-4827-818a-e988bcfd9727.png)

