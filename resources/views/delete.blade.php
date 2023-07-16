<!DOCTYPE html>
<html lang="ja">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">



	<link rel="stylesheet" href="{{asset('style.css')}}">
	<title>Document</title>

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <meta name="csrf-token" content="{{ csrf_token() }}">

</head>
<body>

    <header>
        <div>
            <a class="title" href="{{route('index')}}" >GameFriends</a>
        </div>

        <div>
            <ul>
                <li><a href="{{route('edit')}}">プロフィール</a></li>
                <li><a href="">登録ユーザー一覧</a></li>
                {{-- <li><form action="{{ route('logout')}}" method="post">
                    @csrf
                    <button onclick="return confirm('ログアウトしてよろしいですか?')">ログアウト</button>
                </form></li> --}}
                {{-- <li><a href="{{ route('logout')}}" onclick="return confirm('ログアウトしてよろしいですか?')">ログアウト</a></li> --}}
                <li><a href="{{ url('/logout')}}" onclick="return confirm('ログアウトしてよろしいですか?')">ログアウト</a></li>
            </ul>
        </div>
    </header>

    {{-- <div>
        <label for="user_id">ID検索</label>
        <input type="text" id="user_id" name="user_id" value="">

        <label for="user_name">名前</label>
        <input type="text" id="user_name" name="user_name" value="">
    </div> --}}

    <div class="main">
        <h3><h3>
            <input type="text" name="id" value="" placeholder="IDを入力">
            <button class="iza">検索</button>
        <ul class="ajax">
        </ul>

    </div>

    <diV class="delete">
    <h2>ユーザー一覧</h2>

    <table class="">
        <thead>
          <tr>
            <th>id</th>
            <th>name</th>
            <th>email</th>
            <th>created_at</th>
            <th>updated_at</th>
            <th>削除</th>
          </tr>
        </thead>
        <tbody>
          @foreach ($users as $user)
          <tr id="{{ $user->id }}">
            <td>{{ $user->id }}</td>
            <td>{{ $user->name }}</td>
            <td>{{ $user->email }}</td>
            <td>{{ $user->created_at }}</td>
            <td>{{ $user->updated_at }}</td>
            <td class="deletebtn" data-user-id="{{ $user->id }}"><a href="{{route('deleteexe',$user)}}" onclick="return confirm('削除してよろしいですか?')">削除</a></td>
          </tr>
          @endforeach
        </tbody>
    </table>

    </diV>

    <footer>

    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <!-- Bootstrap Javascript(jQuery含む) -->
    {{-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


    <script>
        $.ajaxSetup({
            headers: { 'X-CSRF-TOKEN': $("[name='csrf-token']").attr("content") },
        })
        $('.iza').on('click', function(){
            id = $('input[name="id"]').val();
            $.ajax({
                url: "{{ route('users') }}",
                method: "POST",
                data: { id : id },
                dataType: "json",
            }).done(function(res){
                console.log(res);
                $('.ajax').children().remove();
                $('.ajax').append('<li>ユーザー名：'+ res.name + '</li>');
                $('.ajax').append('<li>メールアドレス：'+ res.email +'</li>');
                $('.ajax').append('<a href="#{{$user->id}}">'+ res.name +'を表示</a>');
                // $('.ajax').append('<a href="#{{$user->id}}"><li>ユーザー名：'+ res.name + '</li></a>');
                // $('.ajax').append('<li>メールアドレス：'+ res.email +'</li>');
                // $('.ajax').append('<a>削除</a>');
            }).faile(function(){
                alert('通信の失敗をしました');
            });
        });
    </script>


{{-- <script type="text/javascript">
$(function () {
var userid = "";
//done処理時にID検索テキストボックスのthisを使用するためuseridに保存
function fncasyncid(event) {
  userid = event;
}

$('#user_id').on('change',function(){

    var id = $(this).val();

    fncasyncid(this);

    $.ajax({
      url: './users?id='+id,
      type: 'GET',
      dataType: "json",
    }).done(function (data) {
      // 取得成功
      //取得jsonデータ
      var data_stringify = JSON.stringify(data);
      var data_json = JSON.parse(data_stringify);

      //jsonデータから各データを取得
      var id = "";
      var user_name = "";

      if (data_json[0] != null){
        id = data_json[0]["id"];
        user_name = data_json[0]["user_name"];
      }

      $(userid).next('input').val(user_name);

    }).fail(function (data) {
      // 取得失敗
      alert('データ取得出来ませんでした。');
    });
});

});
</script> --}}



    {{-- <script src="main.js"></script> --}}

    {{-- <script>
        let btn = $('.deletebtn'); //like-toggleのついたiタグを取得し代入。
        let userid; //変数を宣言（なんでここで？）
      btn.on('click', function () { //onはイベントハンドラー
        let $this = $(this); //this=イベントの発火した要素＝iタグを代入
        userid = $this.data('user-id'); //iタグに仕込んだdata-review-idの値を取得
        //ajax処理スタート
        $.ajax({
          headers: { //HTTPヘッダ情報をヘッダ名と値のマップで記述
            'X-CSRF-TOKEN' : $('meta[name="csrf-token"]').attr('content')
          },  //↑name属性がcsrf-tokenのmetaタグのcontent属性の値を取得
          url: "{{route('deleteexe')}}", //通信先アドレスで、このURLをあとでルートで設定します
          method: 'POST', //HTTPメソッドの種別を指定します。1.9.0以前の場合はtype:を使用。
          data: { //サーバーに送信するデータ
            'user_id': userid //いいねされた投稿のidを送る
          }
        })

        .done(function (data) {
            console.log('fail');
            // <tbody>
            //   @foreach ($users as $user)
            //   <tr>
            //     <td>{{ $user->id }}</td>
            //     <td>{{ $user->name }}</td>
            //     <td>{{ $user->email }}</td>
            //     <td>{{ $user->created_at }}</td>
            //     <td>{{ $user->updated_at }}</td>
            //     <td><a href="" class="deletebtn" data-user-id="{{ $user->id }}">削除</a></td>
            //   </tr>
            //   @endforeach
            // </tbody>
        });
        //通信失敗した時の処理
        .fail(function () {
          console.log('fail');
        });
    </script> --}}


    </body>
    </html>


