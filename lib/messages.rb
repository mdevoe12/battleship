class Messages

  def self.not_valid_selection
    p "That's not a vlid selection, please select again."
  end

  def not_valid_selection
    self.class.not_valid_selection
  end

end
