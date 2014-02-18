class ModelDecorator
  def to_param_injector(model = model)
    ToParamInjector.new(model: model)
  end
end
