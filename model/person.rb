require_relative 'nameable'
require_relative '../decorator/capitalize_decorator'
require_relative '../decorator/trimmer_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @id = 0
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
    false
  end

  private

  def of_age?
    @age >= 18
  end
end
