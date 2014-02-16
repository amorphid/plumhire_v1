class ToParamSetter
  attr_reader :object

  def initialize(object)
    @object = object
  end

  def override_to_param
    to_param  = "def to_param; \"uuid\"; end"
    object.instance_eval(to_param)
  end
end
