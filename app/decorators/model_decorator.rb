class ModelDecorator
  def to_param_injector(model = model)
    ToParamInjector.new(model: model)
  end

  def version5_uuid_setter(model = model)
    Version5UuidSetter.new(model: model)
  end
end
