module Enumerable
  def my_each
    index = 0
    array = self.class == Array ? self : self.to_a

    while index < array.length
      yield(array[index])
      index += 1
    end
    self
  end

  def my_each_with_index
    index = 0
    array = self.class == Array ? self : self.to_a

    while index < array.length
      yield(array[index],index)
      index += 1
    end
    self
  end

  def my_select
    index = 0
    array = self.class == Array ? self : self.to_a
    collection = []
    while index < array.length
      if yield(array[index])
        collection.push(array[index])
      end
      index += 1
    end
    collection
  end

  def my_all?
  index = 0
    array = self.class == Array ? self : self.to_a
    result = true
    while index < array.length
      unless yield(array[index])
        result = false
      end
      index += 1
    end
    result
  end

  def my_any?
    index = 0
    array = self.class == Array ? self : self.to_a
    result = false

    while index < array.length
      if yield(array[index])
        result = true
      end
      index += 1
    end
    result
  end

  def my_none?
    index = 0
    array = self.class == Array ? self : self.to_a
    result = true

    while index < array.length
      if yield(array[index])
        result = false
      end
      index += 1
    end
    result
  end

  def my_count
    index = 0
    array = self.class == Array ? self : self.to_a
    result = 0
    return array.length unless block_given?
    while index < array.length
      if yield(array[index])
        result += 1
      end
      index += 1
    end
      result
  end

  def my_map
    index = 0
    array = self.instance_of?(Array) ? self : self.to_a
    result = []

    return to_enum(:my_map) unless block_given?

    while index < array.length
      result.push(yield(array[index]))
      index += 1
    end
    result
  end

  def my_inject(result)
    index = 0
    array = self.instance_of?(Array) ? self : self.to_a
    while index < array.length
    result = yield(result, array[index])
    index += 1
    end
    result
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable
end
