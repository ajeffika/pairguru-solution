class TitleBracketsValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add :title, "Wrong brackets" unless validate_string(record.title)
  end

  private

  def validate_string(str)
    stack = []
    lookup = { '(' => ')', '[' => ']', '{' => '}', '<' => '>' }
    left = lookup.keys
    right = lookup.values

    str.each_char.with_index do |char, i|
      if left.include? char
        stack << char
      elsif right.include? char
        return false if lookup.invert[char] == str[i - 1] || stack.empty? || (lookup[stack.pop] != char)
      end
    end
    stack.empty?
  end
end