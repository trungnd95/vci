class Publication
  include Neo4j::ActiveNode
  # id_property :id, type: Integer
  property :title, type: String, index: :exact
  property :url, type: String

  has_many :out, :authors, type: :HAS_AUTHOR

  def self.search(data, type)
    if type == ''
    self.as(:p).authors.as(:a).where("LOWER(p.title) =~ LOWER('.*#{data}.*') OR LOWER(a.name) =~ LOWER('.*#{data}.*')")
      .pluck(:p).uniq{|x| x[:title]}.map(&:neo_id)
    elsif type == 'publication'
      self.as(:p).where("LOWER(p.title) =~ LOWER('.*#{data}.*')").map(&:neo_id)
    elsif type == 'author'
      self.as(:p).authors.as(:a).where("LOWER(a.name) =~ LOWER('.*#{data}.*')").pluck(:p).map(&:neo_id)
    end
  end

  def all_authors
    self.authors.map(&:name).join(',')
  end
end
