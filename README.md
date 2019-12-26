# README

<h2>アプリ概要</h2>
<ol>
	<li>エンドユーザー側：宅配の荷物の日付・時間を変更できる</li>
	<li>配達ドライバー側：荷物の情報が確認できる、配達履歴を残すことができる</li>
	<li>営業所側：荷物の登録・編集などができる</li>
</ol>
　　<p>１〜３を兼ね備えた、エンドユーザーも配達企業も使えるアプリになっています</p>

<h3>実装機能</h3>
<ul>
	<li>モーダルウィンドウ</li>
	<li>非同期通信でのいいね機能</li>
	<li>曖昧検索・完全一致検索機能</li>
	<li>コメント機能</li>
	<li>gem'whenever'でのバッチ処理</li>
	<li>登録機能</li>
	<li>一覧機能</li>
	<li>詳細機能</li>
	<li>編集機能</li>
	<li>削除機能</li>
	<li>論理削除機能</li>
	<li>gem'devise'によるログイン機能</li>
	<li>画像アップロード機能</li>
	<li>gem'kaminari'でのページネーション機能</li>
	<li>gem'bootstrap'によるタブ機能</li>
</ul>

<h3>バージョン</h3>
<ul>
	<li>Ruby 2.5.5<br>Rails 5.2.4</li>
</ul>

<h3>使い方</h3>
<p>営業所</p>
<ul>
	<li>登録したい荷物の品名を登録する</li>
	<li>登録したい荷物の荷主を登録する</li>
	<li>荷物を登録する</li>
</ul>
<p>配達ドライバー</p>
<ul>
	<li>今日の配達コースを登録する</li>
	<li>荷物を持ち出し登録する</li>
	<li>持ち出し一覧で、今の時間帯の荷物を確認しながら配達する</li>
	<li>配達先で不在なら不在報告、完了なら完了報告をする</li>
</ul>
<p>エンドユーザー</p>
<ul>
	<li>電話番号検索で届く予定の荷物の時間を変更できる</li>
	<li>伝票番号検索で荷物の再配達を指定できる</li>
	<li>マイページにて配達ドライバーにいいね・コメントできる</li>
</ul>


