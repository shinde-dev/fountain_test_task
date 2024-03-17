String.class_eval do

  def underscore_to_sym
    scan(/[A-Z][a-z]*/).join("_").downcase.to_sym
  end

  def titleize
    split(/ |\_/).map(&:capitalize).join("")
  end

end