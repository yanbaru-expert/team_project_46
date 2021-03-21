class ImportCsv
  def self.import(path)
    list = []
    CSV.foreach(path, headers: true) do |row|
      row["genre"] = row["genre"].to_i
      list << row.to_h
    end
    list
  end
  
  def self.movie_data(path)
    list = import(path)
    puts "Movieテーブルのデータを削除"
    Movie.destroy_all
    puts "インポート処理を開始"
    Movie.create!(list)
    puts "インポート完了!!"
  end
end
