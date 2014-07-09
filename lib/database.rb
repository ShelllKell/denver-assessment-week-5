class Database
  def initialize
    @entities = []
  end

  def insert(entity) #user
    entity = entity.dup
    entity[:id] = next_id

    @entities.push(entity)

    entity.dup
  end

  def all
    @entities.dup
  end

  class EntityNotFoundError < RuntimeError ; end

  private

  def next_id
    @entities.length + 1
  end

  def offset_id(id)
    id - 1
  end

end
