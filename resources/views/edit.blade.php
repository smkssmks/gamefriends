<x-layout>

 {{-- @if (Route::has('login'))
    <div class="hidden fixed top-0 right-0 px-6 py-4 sm:block">
        @auth
            <a href="{{ url('/dashboard') }}" class="text-sm text-gray-700 dark:text-gray-500 underline">ダッシュボード</a>
        @else
            <a href="{{ route('login') }}" class="text-sm text-gray-700 dark:text-gray-500 underline">ログイン</a>

            @if (Route::has('register'))
                <a href="{{ route('register') }}" class="ml-4 text-sm text-gray-700 dark:text-gray-500 underline">新規登録</a>
            @endif
        @endauth
    </div>
    @endif --}}



    <header>
        <div>
            <a class="title" href="{{route('index')}}">GameFriends</a>
        </div>

        <div>
            <ul>
                <li><a href="">プロフィール</a></li>
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

    {{-- <div>
        <p>ユーザーID：{{Auth::user()->id}}</p>
    </div> --}}

    <div class="container">

        @if(session('message'))
            <div class="red">
                {{session('message')}}
            </div>
        @endif

    <form method="post" enctype="multipart/form-data" action="{{route('update')}}">
        @csrf
        @method('patch')

        <div class="flex">
            <div>
                <label for="image">
                {{-- <img src="{{ Storage::url(Auth::user()->image) }}"  class="editimg"> --}}
                @if (Auth::user()->image === 'img/default.png')
                    <img class="rounded-circle editimg" src="{{ asset('img/default.png') }}" >
                @else
                    <img src="{{ Storage::url(Auth::user()->image) }}"  class="indeximg">
                @endif

                <input id="profile-image" name="image" type="file" class="form-control @error('profile-image') is-invalid @enderror" value="" accept="image/png, image/jpeg">
                </label>
            </div>

            <div class="flex2">
                <div>
                    <p>ユーザーID：{{Auth::user()->id}}</p>
                </div>
                <div class="edit1">
                    <label for="name">ユーザー名：</label>
                    <input type=text name="name" value="{{Auth::user()->name}}">
                    <p class="red" ><x-input-error :messages="$errors->get('name')" class="red"/></p>
                </div>
                <div class="edit1">
                    <label for="playtime">プレイする時間帯：{{Auth::user()->playtime}}</label>
                    {{-- <input type=text neme="playtime" value="{{Auth::user()  ->playtime}}"> --}}

                    <p>変更：</p>
                    <select name="playtime" size="4">
                        <option name="playtime"  value="土日、祝日"
                        @if (Auth::user()->playtime == "土日、祝日"){
                            @php echo 'selected'; @endphp
                        } @endif > 土日、祝日</option>
                        <option name="playtime"  value="夜のみ"
                        @if (Auth::user()->playtime == "夜のみ"){
                            @php echo 'selected'; @endphp
                        } @endif > 夜のみ</option>
                        <option name="playtime"  value="いつでも"
                        @if (Auth::user()->playtime == "いつでも"){
                            @php echo 'selected'; @endphp
                        } @endif > いつでも</option>
                        <option name="playtime"  value="不定期"
                        @if (Auth::user()->playtime == "不定期"){
                            @php echo 'selected'; @endphp
                        } @endif > 不定期</option>
                    </select>

                    <p class="red" ><x-input-error :messages="$errors->get('playtime')" class="red"/></p>
                </div>
            </div>
        </div>

        <h2 class="edit-h2">プレイするゲーム</h2>

        {{-- <select name="game" multiple size="5">
            @foreach($games as $game)
                <option value="{{$game->name}}">{{$game->name}}</option>
            @endforeach
        </select> --}}

        <div class="checkbox">
            @foreach($games as $game)
            <div>
                <label>
                {{-- <input type="hidden" name="{{$game->name}}" value="off"> --}}
                <input type="checkbox" name="{{$game->name}}" value="{{$game->name}}"
                @php $a = array(); @endphp
                @foreach($playgames as $playgame)
                    {{-- $b = {{$playgame->game->name}} --}}
                    @php
                        $b = $playgame->game->name;
                        array_push($a,$b);
                    @endphp
                @endforeach
                {{-- $game={{$game->name}} --}}
                {{-- $playgame = {{$playgames->game->name}} --}}
                @php

                    // $playgame = $playgames->toArray();
                    // dd($playgame);
                    // $playgame = $playgame['game']['name'];
                    // array_column($playgames->game->name,)
                    // $playgame = $playgames->pluck("name");
                @endphp

                {{-- @foreach($playgames as $playgame) --}}
                @if (in_array($game->name,$a)){
                    @php echo "checked"; @endphp
                }
                @endif
                {{-- @endphp --}}
                >{{$game->name}}
                </label>
            </div>
            @endforeach
        </div>
        <p>＊プレイするゲームはここから変更できます。</p>

        <div class="flex3">
            <div class="flex4">
                @foreach($playgames as $playgame)
                    <div class="post">
                        <img src="{{$playgame->game->image}}">
                        <P>{{$playgame->game->name}}</P>
                    </div>
                @endforeach
            </div>

            <div class="textarea">
                {{-- <h3>コメント</h3> --}}
                <textarea name="comment" cols="50" rows="10"    id="comment" placeholder="レベルやランクなどの募集条件,連絡先を記入しよう！">{{Auth::user()->comment}}</textarea>
            </div>
        </div>

        <div class="edit-button">
            {{-- <input type="button"> --}}
            <button>更新</button>
        </div>
    </form>
    </div>
</x-layout>
