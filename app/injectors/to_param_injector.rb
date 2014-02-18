class ToParamInjector
  attr_reader :object

  def initialize(args = {})
    @object = args[:object]
    inject_to_param
  end

  def inject_to_param(object = object)
    to_param  = "def to_param; \"uuid\"; end"
    object.instance_eval(to_param)
  end
end
