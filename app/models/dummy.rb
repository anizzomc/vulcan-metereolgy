class Dummy < ActiveRecord::Base

  def to_s
  "Dummy(#{value})"
  end

end
