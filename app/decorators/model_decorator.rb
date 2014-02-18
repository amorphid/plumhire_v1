class ModelDecorator
  attr_reader :model

  def initialize(args = {})
    @model = args[:model]
    to_param_injector
    version5_uuid_setter
  end

  def to_param_injector(model = model)
    ToParamInjector.new(object: model)
  end

  def version5_uuid_setter(model = model)
    Version5UuidSetter.new(object: model)
  end
end
