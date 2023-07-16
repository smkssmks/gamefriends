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

<p class="hello">こんにちは、{{Auth::user()->name}}さん</p>

<div class="index1">
    <div class="index2">
        {{-- <p>あなた</p> --}}
        <p>
            @if (Auth::user()->image === 'img/default.png')
                <img class="rounded-circle indeximg" src="{{ asset('img/default.png') }}" >
            @else
                <img src="{{ Storage::url(Auth::user()->image) }}"  class="indeximg">
            @endif
            {{-- <img src="{{ Storage::url(Auth::user()->image) }}"  class="indeximg"> --}}
        </p>

        <p>
        {{Auth::user()->name}}
        </p>
    </div>

    <a href="{{ route('search') }}">
        ユーザー検索　<i class="bi bi-search"></i>
    </a>
</div>

<section class="indexsec">
    <h2>ユーザー</h2>

    <div>
    @foreach($users as $user)
        <a href="{{route('user',$user)}}" class="indexa">
        @if ($user->image === 'img/default.png')
            <img class="rounded-circle index2img" src="{{ asset('img/default.png') }}" >
        @else
            <img src="{{ Storage::url($user->image) }}"  class="index2img">
        @endif
        {{$user->name}}
        {{-- <p>{{$user->comment}}</p> --}}
        </a>
    @endforeach
    </div>

    {{-- @foreach($user_ids as $user_id)

        {{$user_id->user->name}}

    @endforeach --}}

    <div class="mb-4">
        {{ $users->links('pagination::bootstrap-5') }}
    </div>

</section>

</x-layout>
