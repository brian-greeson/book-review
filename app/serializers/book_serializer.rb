class BookSerializer
  def self.injest(json)
    title =  json[:docs].first[:title_suggest]
    author =  json[:docs].first[:author_name]
    publisher =  json[:docs].first[:publisher].join(', ')
    Book.new({title: title, author: author, publisher: publisher})
  end
end
