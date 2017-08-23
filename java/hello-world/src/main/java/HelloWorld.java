public class HelloWorld {
    public static String hello(String name) {
      return "Hello, " + getName(name) + "!";
    }

    private static String getName(String name){
      if(name == null || name.length() == 0)
        return "World";
      return name;
    }
}
