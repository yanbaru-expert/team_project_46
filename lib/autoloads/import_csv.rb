class ImportCsv
  def self.import(path)
    list = []
    CSV.foreach(path, headers: true) do |row|
      data = row.to_h.transform_values do |val|
        /^[0-9]+$/ =~ val ? val.to_i : val
      end
      list << data
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
