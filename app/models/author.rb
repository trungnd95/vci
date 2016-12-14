class Author
  include Neo4j::ActiveNode
  # id_property :id, type: Integer
  property :name, type: String, index: :exact

  has_many :in, :publications, origin: :authors
end
