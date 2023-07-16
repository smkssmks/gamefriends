<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Scripts -->
        @vite(['resources/css/app.css', 'resources/js/app.js'])

        <style>
            body{
                background-color: darkslateblue ;
            }

            h2{
                font-size: 50px;
                margin-bottom: 30px;
                color: gold;
            }

            .new{
                /* color: yellow; */
                /* margin-top: 20px; */
                font-size: 16px;
                font-weight:bold;
                margin-right:85px;
            }
        </style>
    </head>
    <body class="font-sans text-gray-900 antialiased">
        <div class="min-h-screen flex flex-col sm:justify-center items-center pt-6 sm:pt-0 ">
            <div>
                {{-- <a href="/"> --}}
                    {{-- <x-application-logo class="w-20 h-20 fill-current text-gray-500" /> --}}
                    <h2 class="h2 lead display-1">GameFriends</h2>
                {{-- </a> --}}
            </div>

            <div class="w-full sm:max-w-md mt-6 px-6 py-4 bg-white shadow-md overflow-hidden sm:rounded-lg">
                {{ $slot }}
            </div>

            {{-- <a href="{{route('register')}}" class="new">新規登録はこちら</a> --}}
        </div>
    </body>
</html>