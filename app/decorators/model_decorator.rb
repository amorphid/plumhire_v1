class ModelDecorator
  attr_reader :model

  def initialize(model)
    @model = model.new
  end

  def response
    model
  end
end
