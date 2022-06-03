class Serialize

  def initialize(object, name)
    @object = Marshal.dump(object)
    @saved = { name => @object }
    print object
  end

end
