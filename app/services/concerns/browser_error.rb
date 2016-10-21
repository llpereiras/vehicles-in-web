class BrowserError < StandardError
  attr_reader :parent_exception
  attr_reader :attributes
  def initialize(msg="Erro ao carregar página", parent_exception = nil, attributes = {} )
    @parent_exception = parent_exception
    @attributes = attributes
    super(msg)
  end
end