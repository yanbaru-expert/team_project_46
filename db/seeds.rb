EMAIL = 'test@example.com'
PASSWORD = 'password'

User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  puts 'ユーザーの初期データインポートに成功しました。'
end

class ImportCsv
  def self.movie_import(path)
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        genre: row["genre"].to_i,
        title: row["title"],
        url: row["url"] 
      }
    end
    list
  end
  
  def self.movie_data
    list = movie_import("db/csv_data/movie_data.csv")
    puts "Movieテーブルのデータを削除"
    Movie.destroy_all
    puts "インポート処理を開始"
    Movie.create!(list)
    puts "インポート完了!!"
  end
end

ImportCsv.movie_data
