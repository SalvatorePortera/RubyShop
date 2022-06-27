major_category_names = ["お菓子", "神薬", "化粧品", "魔法瓶・炊飯器・時計・スーツケース", "家電・カメラ", "万年筆・文房具・雑貨", "伝統工芸品・富士山・桜", "贈る相手別", "ゲーム・アニメ"]

major_category_names.each do |major_category_name|
  MajorCategory.create(
    name: major_category_name,
    description: major_category_name,
  )
end
