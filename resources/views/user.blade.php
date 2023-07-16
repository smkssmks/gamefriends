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
                {{-- <li><a href="">登録ユーザー一覧</a></li> --}}
                {{-- <li><form action="{{ route('logout')}}" method="post">
                    @csrf
                    <button onclick="return confirm('ログアウトしてよろしいですか?')">ログアウト</button>
                </form></li> --}}
                {{-- <li><a href="{{ route('logout')}}" onclick="return confirm('ログアウトしてよろしいですか?')">ログアウト</a></li> --}}
                <li><a href="{{ url('/logout')}}" onclick="return confirm('ログアウトしてよろしいですか?')">ログアウト</a></li>
            </ul>
        </div>

    </header>

    <div class="container">

        <p>ユーザーID：{{$user->id}}</p>

        <div class="userflex">
            <div>
            @if ($user->image === 'img/default.png')
                <img class="rounded-circle indeximg" src="{{ asset  ('img/default.png') }}" >
            @else
                <img src="{{ Storage::url($user->image) }}"     class="indeximg">
            @endif


            <P>名前：{{$user->name}}</P>
            <p>プレイする時間：{{$user->playtime}}</p>
            <p>プレイするゲーム</p>
            </div>

            {{-- <div>
                <p>ユーザーID：{{$user->id}}</p>
            </div> --}}

            <div class="user-com">
                <p>{{$user->comment}}</p>
            </div>

        </div>

        <div class="flex4">
            @foreach($playgames as $playgame)
                <div class="post">
                    <img src="{{ asset($playgame->game->image) }}">
                    <P>{{$playgame->game->name}}</P>
                </div>
            @endforeach
        </div>


    </div>


</x-layout>
