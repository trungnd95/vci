module PublicationsHelper
  def link_auth authors_name
    authors_name.split(',').map{|author| link_to author, publications_path(auth: author)}.join(',')
  end
end
