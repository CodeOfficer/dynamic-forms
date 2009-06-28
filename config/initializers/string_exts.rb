class String
  def to_field_id
    result = self.downcase
    result.gsub!(/&(\d)+;/, '')  # Ditch Entities
    result.gsub!('&', 'and')     # Replace & with 'and'
    result.gsub!(/['"]/, '')    # replace quotes by nothing
    result.gsub!(/\W/, ' ')     # strip all non word chars
    result.gsub!(/\ +/, '_')    # replace all white space sections with a dash
    result.gsub!(/(-)$/, '')    # trim dashes
    result.gsub!(/^(-)/, '')    # trim dashes
    result.gsub!(/[^a-zA-Z0-9\-]/, '_') # Get rid of anything we don't like
    result
  end

  def to_field_id!
    self.replace(self.slugorize)
  end
  
  def slugorize
    result = self.downcase
    result.gsub!(/&(\d)+;/, '')  # Ditch Entities
    result.gsub!('&', 'and')     # Replace & with 'and'
    result.gsub!(/['"]/, '')    # replace quotes by nothing
    result.gsub!(/\W/, ' ')     # strip all non word chars
    result.gsub!(/\ +/, '-')    # replace all white space sections with a dash
    result.gsub!(/(-)$/, '')    # trim dashes
    result.gsub!(/^(-)/, '')    # trim dashes
    result.gsub!(/[^a-zA-Z0-9\-]/, '-') # Get rid of anything we don't like
    result
  end

  def slugorize!
    self.replace(self.slugorize)
  end
end
