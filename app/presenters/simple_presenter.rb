class SimplePresenter
  attr_reader :delegate
  def initialize(delegate)
    @delegate = delegate
  end

  def method_missing(symbol, *args)
    delegate.send(symbol, *args)
  end
end