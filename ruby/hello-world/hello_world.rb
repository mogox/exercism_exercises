class HelloWorld
  def self.hello(name = nil)
    name ||= "World"
    "Hello, #{name}!"
  end
end
