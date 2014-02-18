class SignUpConstructor
  attr_reader :sign_up

  def initialize
    @sign_up = SignUp.new
  end

  def model_decorator(sign_up = sign_up)
    ModelDecorator.new(model: sign_up)
  end

  def response
    model_decorator
    sign_up
  end
end
