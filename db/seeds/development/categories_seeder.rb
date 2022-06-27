# このシーダーは、先にmajor_categories_seeder.rbで親カテゴリを作成しておかないと動作しない
  major_category_names_and_ids = MajorCategory.major_category_name_and_id


major_category_names = ["お菓子", "神薬", "化粧品", "魔法瓶・炊飯器・時計・スーツケース", "家電・カメラ", "万年筆・文房具・雑貨", "伝統工芸品・富士山・桜", "贈る相手別", "ゲーム・アニメ"]

sweets_categories = ["白い恋人", "人気新作予備", "東京お菓子", "京都・大阪お菓子", "キットカット", "ご当地ポッキー", "じゃがポックル", "人気新作予備2", "地方限定プリッツ", "地方限定じゃがりこ", "東京ばなな", "うまい棒", "柿の種", "アニメお菓子", "きのこの山", "ザ・チョコレート", "アルフォート", "カントリーマアム", "ブラックサンダー", "ルマンド", "ヨックモック", "駄菓子", "コロロ", "こんにゃくぜりー蒟蒻畑", "果汁グミ", "地方限定クッキー", "ピュレグミポケモン電撃トロピカあじ", "プリングルス キティコラボ", "コロログミ", "一蘭", "一風堂", "山頭火", "横浜家系", "全国・北海道有名店", "地方限定 カップ麺", "どん兵衛 地方限定"]
drug_categories = ["イブクイック", "パブロンゴールド", "キャベジンコーワ", "正露丸", "新ビオフェルミン", "太田胃酸", "休息シート・休足時間", "足リラシート", "蒸気でアイマスク", "めぐリズム無香料", "ノビルン", "ロイヒつぼ膏", "龍角散", "サロンパス", "ロートリセ", "アイボン", "Sante-FX点眼薬 サンテ ポーティエ", "ウナコーワ", "強力わかもと", "口内炎パッチ", "花王おむつ", "花王ナプキンスリムガード（零触感）", "花王ナプキンしあわせ素肌（）", "花王ナプキン超瞬吸（超吸収ガード）", "花王ナプキン肌キレイガード", "花王キュレル ジェルクリーム 肌乾燥用", "花王リーゼプリティア", "皇漢堂漢方便秘薬 ビューラック", "佐藤製薬 鼻炎スプレー ナザール", "KissYouイオン歯磨き", "ホタテの力くん（野菜洗浄剤）", "小林製薬 角質除去クリーム ニノキュア", "小林製薬 傷痕除去クリーム アットノン", "液体絆創膏　サカムケア", "qtto メディキュット", "人気新作予備", "人気新作予備2", "風邪薬", "痛み止め", "鼻水・鼻炎", "喉・口内炎", "胃腸薬", "便秘薬・浣腸剤", "整腸剤", "下痢止め", "乗り物酔い止め", "傷薬・傷口用消毒剤", "手指消毒・器具消毒剤", "目薬", "洗眼剤", "コンタクト装着液", "動悸・息切れ", "貧血", "関節痛・神経痛", "肌・皮膚の薬", "肩こり腰痛筋肉痛", "漢方薬・生薬", "ドリンク剤・ビタミン剤・活力剤", "肝機能改善", "眠気防止剤", "睡眠鎮静剤", "歯槽膿漏治療剤", "うおの目・タコ・イボ改善剤", "水虫改善薬", "痔の薬", "育毛剤養毛剤", "耳の薬", "婦人薬", "妊娠検査薬", "睡眠薬"]
cosmetic_categories = ["SK II 神仙水", "SK-II フェイシャルトリートメントマスク他", "SKⅡスキンパワークリーム", "資生堂パーフェクトホイップ洗顔フォーム", "資生堂UNO フェイシャルクレンザー", "資生堂 FWB フルメークウォッシャブルベース（化粧下地）", "資生堂Finoヘアマスク", "資生堂TSUBAKIシャンプー", "資生堂アクアレーベル ジェルクリーム", "資生堂予備モアリップ", "資生堂アイラッシュカーラー", "資生堂スキンケア・ボディケア", "資生堂バス用品", "資生堂ヘアケア・カラースタイリング", "資生堂アイメイク", "資生堂ベースメイク・フェイスメイク", "資生堂ルージュ・グロス・リップライナー", "資生堂メイクアップセット", "資生堂クレンジング・メイク落とし", "資生堂ネイル", "資生堂香水", "資生堂メイク道具", "資生堂無駄毛処理", "資生堂栄養補助食品", "freeplus", "KissMe マスカラ他", "KATE 口紅", "KATE アイブロウ", "KATE アイシャドウ", "KATE リキッドファンデーション", "KATE アイライナー", "KATE マスカラ", "KATE パウダーファンデーション", "KATE スキンケア・ボディケア", "KATE ヘアケア・カラースタイリング", "KATE メイク", "KATE ネイル", "コーセー ヒアルロン酸 超保湿美白マスク", "KOSE ソフティモ 角栓スッキリ黒パック", "コーセースキンケア・ボディケア", "コーセーバス用品", "コーセーヘアケア・カラースタイリング", "コーセーアイメイク", "コーセーベースメイク・フェイスメイク", "コーセー口紅・グロス・リップライナー", "コーセークレンジング・メイク落とし", "コーセーネイル", "コーセー香水", "コーセーメイク道具", "雪肌精スキンケア・ボディケア", "雪肌精メイク", "雪肌粋とsuisaiの洗顔パウダー", "コスメデコルテ 美容液 リポソーム", "コスメデコルテ スキンケア・ボディケア", "コスメデコルテ ヘアケア", "コスメデコルテ メイク", "コスメデコルテ 香水", "コスメデコルテ メイク道具", "ドクターシーラボ アクアコラーゲンジェル", "ドクターシーラボ ラロッシュポゼ トレリアン", "POLAホワイトショット", "POLA BAローション（POLA BAでtaobao販売多数）", "江原堂", "江原堂2", "ハトムギ化粧水", "ドクターズコスメ", "DHCリップクリーム", "DHCオリーブ石鹸", "DHCクレンジングオイル", "ニベア フレーバーリップ ピーチの香りアップルの香り（日本限定）", "ウーノ UVパーフェクションジェル", "ハニーチェ シャンプー", "LUSH美容液他", "豆乳イソフラボンクリーム", "ペアアクネクリーム", "毛穴なでしこ", "ルルルンマスク", "ALBION 化粧水", "Cureナチュラルアクアジェル", "シュウウエムラ クレンジングオイル", "花王キュレル　ジェルクリーム", "肌美精マスク・クラシエマスク", "肌美精マスク・クラシエマスク", "豆腐の盛田屋 フェイスシートマスク", "マンダンベイビーマッスルマスク", "ゴールデンジュレ フェイスマスク", "ミノン アミノモイストしっとりぷるぷるマスク", "SPC毒蛇マスク", "HABA ハーバー 薬用ホワイトレディ スクワラン 角質除去美容液", "ソンバーユ スキンクリーム", "LOSHIロッシ スキンクリーム", "RMK ファンデーション", "RMK", "ポール＆ジョーリキッドファンデーション", "KissMe アイライナー ヒロインメイク", "Canmake （パウダー・５色）チーク", "Canmakeステイオンバームルージュ", "Canmake マシュマロ フェイスパウダー", "ロゼット 洗顔石鹸 洗顔パスタ", "マンダム ビフェスタ アイメイクアップリムーバー", "太陽のアロエ社 ヒアルロン酸", "熊野筆"]
thermos_categories = ["象印水筒", "タイガー水筒", "象印魔法瓶", "タイガー魔法瓶", "象印ステンレスジャー/象印焖烧杯", "パナソニック炊飯器", "パナソニック炊飯器1-2人用", "パナソニック炊飯器3-5人用", "パナソニック6人用", "象印炊飯器", "象印炊飯器1-2人用", "象印炊飯器3-5人用", "象印炊飯器6人用", "タイガー炊飯器", "タイガー炊飯器1-2人用", "タイガー炊飯器3-5人用", "タイガー炊飯器6人用", "Gshock 日本限定モデル", "時計 日本限定", "スーツケース 大型"]
electric_categories = ["パナソニックマイナスイオンヘアドライヤー イオにティ", "パナソニックフェイススチーマー", "日立ハダクリエ", "Rifa 美顔ローラー", "belulu 美ルル 美顔器 ゴールドスティック", "パナソニックビューティ美顔器・美容器", "パナソニックビューティフェイススチーマー", "パナソニックビューティヘアドライヤー", "パナソニックビューティ脱毛器", "パナソニックビューティレディースシェイバー", "パナソニックビューティヘアアイロン", "パナソニックビューティメンズシェーバー", "パナソニックビューティ電動頭皮ブラシ", "チェキ フィルムカメラ", "デジタル一眼レフカメラ キャノン他", "ミラーレス一眼レフカメラ ソニー他", "カメラ交換レンズ", "フラッシュ・ストロボ", "空気清浄機・加湿器 ダイキンパナソニック他", "衣類乾燥機・除湿機", "加湿器"]
stationary_categories = ["万年筆 ギフト", "テープ 柄可愛い", "おしゃれ雑貨レターセット文房具", "手紙 おしゃれ", "手帳", "手紙　おしゃれ", "可愛いペン", "文房具しおり", "文房具しおり", "ドールハウス", "アートマーカー", "色鉛筆", "京珠堂クリスタルブレスレット"]
gift_categories = ["招き猫", "信楽焼 たぬき", "だるま 高崎だるま", "こけし かわいい", "南部鉄器", "江戸切子 グラス", "箱根寄木細工（神奈川県）", "高岡銅器 七福神 龍神", "輪島塗 食器 お椀 お箸 夫婦", "有田焼伊万里 湯呑み 茶碗", "堺打刃物", "京扇子", "京うちわ 房州うちわ", "江戸切子 富士山グラス", "伝統工芸品 綺麗", "和紙照明 和風照明", "置物 和風", "髪飾り リボン", "かんざし 髪飾り 桜", "熊野筆", "富士山", "富士山 Tシャツ", "富士山 タンブラー", "桜 工芸品", "桜 タンブラー", "浮世絵 Tシャツ", "浮世絵 民芸品", "侍 Tシャツ", "侍 民芸品", "悪魔の侍 Tシャツ", "富士山 ポストカード", "桜 ポストカード", "浮世絵 ポストカード", "お茶 長寿", "お茶 玉露"]
vip_categories = ["母", "父", "祖父母", "親戚", "親友", "友人", "目上の人・先生", "仕事関係の人", "金運", "開運・厄除", "安産子宝", "合格祈願", "長寿健康", "結婚出会い", "交通安全"]
game_categories = ["任天堂switch", "プレイステーション", "ゲームソフト", "呪術廻戦", "呪術廻戦ステッカー", "鬼滅の刃", "ドラゴンボール ", "ワンピース グッズ", "ナルト", "ポケモン 日本限定", "ポケモン", "進撃の巨人", "セイラームーン", "ディズニー 日本限定", "ハローキティ 日本限定", "トレーディングカード", "コレクションカード", "遊戯王 トレーディングカード", "ドラゴンボール トレーディングカード", "デュエルマスターズ トレーディングカード", "ポケモン トレーディングカード", "ガンダム プラモデル", "アクリルスタンド", "ガチャ", "キーホルダー", "ぬいぐるみ アニメきゃら", "フィギュア", "Tシャツ", "スマホケース", "バッジ", "時計", "バッグ", "食器", "文房具", "タオル", "クッション", "ハンカチ", "お皿お椀", "クリアファイル", "お箸", "弁当箱", "財布", "マグカップ", "ステッカー"]


major_category_names_and_ids.each do |major_category_name,major_category_id|

  
 if major_category_name == "お菓子"
    sweets_categories.each do |sweets_category|
      Category.create!(name: sweets_category,description: sweets_category,major_category_name: major_category_name,major_category_id: major_category_id)
    end
    
 elsif major_category_name == "神薬"
    drug_categories.each do |drug_category|
    Category.create!(name: drug_category,description: drug_category,major_category_name: major_category_name,major_category_id: major_category_id)
    end
    
 elsif major_category_name == "化粧品"
    cosmetic_categories.each do |cosmetic_category|
      Category.create!(name: cosmetic_category,description: cosmetic_category,major_category_name: major_category_name,major_category_id: major_category_id)
    end
    
 elsif major_category_name == "魔法瓶・炊飯器・時計・スーツケース"
    thermos_categories.each do |thermos_category|
      Category.create!(name: thermos_category,description: thermos_category,major_category_name: major_category_name,major_category_id: major_category_id)
    end
 
 elsif major_category_name == "家電・カメラ"
  electric_categories.each do |electric_category|
   Category.create!(name: electric_category,description: electric_category,major_category_name: major_category_name,major_category_id: major_category_id)
  end

 elsif major_category_name == "万年筆・文房具・雑貨"
  stationary_categories.each do |stationary_category|
   Category.create!(name: stationary_category,description: stationary_category,major_category_name: major_category_name,major_category_id: major_category_id)
  end
   
 elsif major_category_name == "伝統工芸品・富士山・桜"
  gift_categories.each do |gift_category|
   Category.create!(name: gift_category,description: gift_category,major_category_name: major_category_name,major_category_id: major_category_id)
  end
   
 elsif major_category_name == "贈る相手別"
  vip_categories.each do |vip_category|
   Category.create!(name: vip_category,description: vip_category,major_category_name: major_category_name,major_category_id: major_category_id)
  end
   
 elsif major_category_name == "ゲーム・アニメ"
  game_categories.each do |game_category|
   Category.create!(name: game_category,description: game_category,major_category_name: major_category_name,major_category_id: major_category_id)
  end   

 end

end