module NGR
  class ReaderWriter

    def initialize(args = {})
      args.each do |key, value|
        inject_getter(key)
        inject_setter(key)
        set_value(key, value)
      end
    end

    def inject_getter(key)
      getter = set_getter(key)
      self.instance_eval(getter)
    end

    def inject_setter(key)
      setter = set_setter(key)
      self.instance_eval(setter)
    end

    def set_setter(key)
      "def #{key}=(value); @#{key}=value; end;"
    end

    def set_getter(key)
      "def #{key}; @#{key} ; end;"
    end

    def set_value(key, value)
      self.instance_variable_set("@#{key}", value)
    end
  end
end

describe NGR::ReaderWriter do
  subject { NGR::ReaderWriter.new }

  context "#inject_getter" do
    it "adds method to the object" do
      subject.inject_getter("hello")
      subject.instance_variable_set("@hello", "world")
      hello  = subject.hello
      expect(hello).to eq("world")
    end
  end

  context "#inject_setter" do
    it "adds method to the object" do
      subject.inject_setter(:hello)
      subject.hello = "world"
      hello  = subject.instance_variable_get("@hello")
      expect(hello).to eq("world")
    end
  end

  context "#set_getter" do
    it "generates getter" do
      getter = subject.set_getter(:hello)
      expect(getter).to eq("def hello; @hello ; end;")
    end
  end

  context "#set_setter" do
    it "generates setter" do
      getter = subject.set_setter(:hello)
      expect(getter).to eq("def hello=(value); @hello=value; end;")
    end
  end

  context "#set_value" do
    it "#set_value" do
      subject.set_value(:hello, "world")
      hello = subject.instance_variable_get("@hello")
      expect(hello).to eq("world")
    end
  end
end
