<x-layout>

    <header>
        <div>
            <a class="title" href="{{route('index')}}" >GameFriends</a>
        </div>

        <div>
            <ul>
                <li><a href="{{route('edit')}}">プロフィール</a></li>
                @if (Auth::user()->role == 0)
                    <li><a href="{{route('delete')}}">登録ユーザー一覧</a></li>
                @endif
                {{-- <li><form action="{{ route('logout')}}" method="post">
                    @csrf
                    <button onclick="return confirm('ログアウトしてよろしいですか?')">ログアウト</button>
                </form></li> --}}
                {{-- <li><a href="{{ route('logout')}}" onclick="return confirm('ログアウトしてよろしいですか?')">ログアウト</a></li> --}}
                <li><a href="{{ url('/logout')}}" onclick="return confirm('ログアウトしてよろしいですか?')">ログアウト</a></li>
            </ul>
        </div>
    </header>

    <form method="post" action="{{route('list')}}" class="ser">
        @csrf
        @method('patch')

        {{-- <div class="edit1">
            <label for="name">ユーザー名：</label>
            <input type=text name="name" value="">
        </div> --}}

        <div>
            <p>◆プレイする時間帯</p>
            <label>
            <input type="radio" name="playtime" value="土日、祝日" checked>土日、祝日　
            </label>
            <label>
            <input type="radio" name="playtime" value="夜のみ">夜のみ　
            </label>
            <label>
            <input type="radio" name="playtime" value="いつでも">いつでも　
            </label>
            <label>
            <input type="radio" name="playtime" value="不定期">不定期　
            </label>
        </div>

        <div>
            <p>◆プレイするゲーム</p>

                @foreach($games as $game)

                <label>
                    <input type="radio" name="playgame" value="{{$game->name}}"
                    @if ($game->name == "スマッシュブラザーズSPECIAL（ガチ）"){
                        @php echo "checked" ; @endphp
                    } @endif>{{$game->name}}　
                </label>
                @endforeach
        </div>

        <button class="serbtn">検索</button>

    </form>



</x-layout>
