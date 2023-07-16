<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\PlayGame;
use App\Models\Game;
use Illuminate\Support\Facades\Auth;


class UserController extends Controller
{
    public function index() {
        // $users=User::all();
        $users = User::paginate(20);
        return view('index', compact('users'));
    }

    public function user(User $user) {
        // $userid = User::where('id',$user->id())->get();
        $playgames=PlayGame::where('user_id',$user->id)->get();
        $games=Game::all();
        return view('user',compact('user','playgames','games'));
    }

    public function edit() {
        // $users=User::all();
        // return view('edit', compact('users'));
        $playgames=PlayGame::where('user_id',auth()->id())->get();

        $games=Game::all();
        // $games=Game::orderBy("id","asc")->get();
        return view('edit', compact('playgames','games'));
        // return view('edit');
    }

    public function search() {
        // $users=User::all();
        $games=Game::all();
        return view('search',compact('games'));
    }

    public function delete() {
        $users = User::all();
        return view('delete',compact('users'));
    }

    public function users(){

        // $id = $request->id;

        // $name = User::where('id',$id)->get(['name']);

        $id = request()->get('id');

        $name = User::find($id)->name;
        $email = User::find($id)->email;
        // $name = User::find($id);

        // $name = User::where('name',$id)->first('name');
        // $email = User::where('name','like','%'.$id.'%')->first('email');

        return response()->json(['name' => $name, 'email' => $email]);
    }

    public function deleteexe(User $user) {

        // $userid = $request->user_id;

        User::where('id',$user->id)->delete();

        $users = User::all();

        // $param = User::all();
        return view('delete',compact('users'));
        // return response()->json($param);
    }

    public function list(Request $request)  {

        // $inputs = $request->all();

        // $games=Game::all();

        $playtime=$request->playtime;


        $playgame=$request->playgame;

        if ($playgame == "スマッシュブラザーズSPECIAL（ガチ）"){
            $game_id = 1;
        } elseif ($playgame == "スマッシュブラザーズSPECIAL（エンジョイ）") {
            $game_id = 2;
        } elseif ($playgame == "スプラトゥーン3（ガチ）") {
            $game_id = 3;
        } elseif ($playgame == "スプラトゥーン3（エンジョイ）") {
            $game_id = 4;
        } elseif ($playgame == "モンスターハンターライズ（ガチ）") {
            $game_id = 5;
        } elseif ($playgame == "モンスターハンターライズ（エンジョイ）") {
            $game_id = 6;
        } elseif ($playgame == "APEX LEGENDS（ガチ）") {
            $game_id = 7;
        } elseif ($playgame == "APEX LEGENDS（エンジョイ）") {
            $game_id = 8;
        } elseif ($playgame == "Dead by Daylight（ガチ）") {
            $game_id = 9;
        } elseif ($playgame == "Dead by Daylight（エンジョイ）") {
            $game_id = 10;
        } elseif ($playgame == "VALORANT（ガチ）") {
            $game_id = 11;
        } elseif ($playgame == "VALORANT（エンジョイ）") {
            $game_id = 12;
        } elseif ($playgame == "Shadowverse（ガチ）") {
            $game_id = 13;
        } else {
            $game_id = 14;
        }


        // $game_id =7;

        // $game_id = Game::where('name',$playgame)->get();
        // $game_id = Game::select('name')->where('name',$playgame)->get();
        // dd($game_id);
        // $game_id = Game::where('name',$playgame)->get();
        // foreach($game_ids as $game_id){
        //     $user_ids=PlayGame::where('game_id',$game_id)->get(['user_id']);
        // }

        // $user_ids = PlayGame::where('game_id',$game_id)->get(['user_id']);
        // $user_id = PlayGame::select('user_id')->where('game_id',$game_id)->get();
        $users= PlayGame::where('game_id',$game_id)->get();
        // $users = User::paginate(10);
        // $users= PlayGame::where('game_id',$game_id)->paginate(5);
        // $user_ids = PlayGame::select('user_id')->where('game_id',$game_id)->get();

        // return $user_id->user->name;

        // foreach($user_ids as $user_id){
        //     return $user_id->user->name;
        // }
        // dd($user_id);
        // $users_game=User::where('id',$user_id)->get();

        // return $user_id -> user_id ;

        // $users = User::where('playtime',$playtime)->get();

        // $users2=User::where('playgame',$playgame)->get();

        return view('list', compact('users','playtime','playgame'));
    }


    public function update(Request $request){
        // dd($request);



        $inputs = $request->all();

        $validated = $request -> validate([
            'name' => 'required',
            // 'playtime' => 'required'
        ]);

        if ($request->image != null) {
            // storeメソッドで一意のファイル名を自動生成しつつstorage/app/public/profilesに保存し、そのファイル名（ファイルパス）を$profileImagePathとして生成
            $profileImagePath = $request->image->store('public/profiles');
        } else {
            $profileImagePath = null;
        }

        // if ()

        $user = User::find(auth()->id());
        $user->fill([
            'name' => $validated['name'],
            // 'playtime' => $inputs['playtime'],
            // 'playtime' => $validated['playtime'],
            // 'image' => $profileImagePath,
            'comment' => $inputs['comment']
            // 'body' => $inputs['body'],
        ]);

        if($request->playtime != null) {
            $user->fill([
                'playtime' => $inputs['playtime']
            ]);
        }

        if($profileImagePath != null) {
            $user->fill([
                'image' => $profileImagePath
            ]);
        }

        $user->save();


        // $playgames = $request->playgames;

        // foreach($playgames as $playgame){

        //     $game = Game::where('name',$playgame)->get();

        //     if(true){
        //         PlayGame::create([
        //             'user_id' => auth()->id(),
        //             'game_id' => $game->id()
        //         ]);
        //     } else {
        //         PlayGame::where('user_id',auth()->id(),'game_id',$game)->delete();
        //     }
        // }

        if($request->has('スマッシュブラザーズSPECIAL（ガチ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',1)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 1
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',1)->delete();
        }

        if($request->has('スマッシュブラザーズSPECIAL（エンジョイ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',2)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 2
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',2)->delete();
        }

        if($request->has('スプラトゥーン3（ガチ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',3)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 3
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',3)->delete();
        }

        if($request->has('スプラトゥーン3（エンジョイ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',4)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 4
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',4)->delete();
        }

        if($request->has('モンスターハンターライズ（ガチ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',5)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 5
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',5)->delete();
        }

        if($request->has('モンスターハンターライズ（エンジョイ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',6)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 6
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',6)->delete();
        }

        if($request->has('APEX_LEGENDS（ガチ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',7)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 7
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',7)->delete();
        }

        if($request->has('APEX_LEGENDS（エンジョイ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',8)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 8
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',8)->delete();
        }

        if($request->has('Dead_by_Daylight（ガチ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',9)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 9
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',9)->delete();
        }

        if($request->has('Dead_by_Daylight（エンジョイ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',10)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 10
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',10)->delete();
        }

        if($request->has('VALORANT（ガチ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',11)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 11
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',11)->delete();
        }

        if($request->has('VALORANT（エンジョイ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',12)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 12
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',12)->delete();
        }

        if($request->has('Shadowverse（ガチ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',13)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 13
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',13)->delete();
        }

        if($request->has('Shadowverse（エンジョイ）')){
            if(!(PlayGame::where('user_id',auth()->id())->where('game_id',14)->exists())){
                PlayGame::create([
                    'user_id' => auth()->id(),
                    'game_id' => 14
                ]);
            }
        } else {
            PlayGame::where('user_id',auth()->id())->where('game_id',14)->delete();
        }

        return back()->with('message','更新しました');

    }
}
