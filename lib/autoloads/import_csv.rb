require "csv"

class ImportCsv
  def self.import(path)
    list = []
    CSV.foreach(path, headers: true) do |row|
      data = row.to_h.transform_values do |val|
        /\A\d+\z/ =~ val ? val.to_i : val
      end
      list << data
    end
    list
  end
  
  def self.movie_data(path)
    list = import(path)
    puts "moviesテーブルのデータを削除"
    Movie.destroy_all
    puts "インポート処理を開始"
    Movie.create!(list)
    puts "インポート完了!!"
  end

  def self.text_data(path)
    list = import(path)
    puts "インポート処理を開始"
    Text.destroy_all
    Text.create!(list)
    puts "インポート完了！！"
  end
end
