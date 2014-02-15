class SignUpConstructor
  attr_reader :sign_up

  def initialize
    @sign_up = SignUp.new
  end

  def response
    sign_up
  end
end
