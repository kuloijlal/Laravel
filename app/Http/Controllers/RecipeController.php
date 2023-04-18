<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Recipe;
use App\Models\Tool;
use App\Models\Ingredient;
use App\Models\RecipeView;
use App\Models\Rating;
use Helpers\MessageError;

class RecipeController extends Controller
{

    public function show_recipes(){

        $recipes = Recipe::with('user')->where('status_resep','publish')->get();

        $data = [];

        foreach ($recipes as $recipe) {
            array_push($data,[
                'idresep'=>$recipe->idresep,
                'judul'=>$recipe->judul,
                'gambar'=>url($recipe->gambar),
                'nama'=>$recipe->user->name
            ]);
        }
        return response()->json($data,200);
    }

    public function get_recipe_by_id(Request $request)
    {
        $recipe = Recipe::where('status_resep', 'publish')->where('idresep', $request->idresep);
        if (!$recipe->exists()) {
            return response()->json([
                'status' => 'error',
                'message' => 'Resep tidak ditemukan'
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'idresep' => 'required',
        ]);

        if ($validator->fails()) {
            return MessageError::message($validator->errors()->messages());
        }

        $id = $request->idresep;
        $recipe = Recipe::where('idresep', $id)->first();
        if (!$recipe) {
            return response()->json([
                'status' => 'error',
                'message' => 'Resep tidak ditemukan'
            ], 404);
        }

        $recipes = Recipe::where('status_resep', 'publish')->where('idresep', $request->idresep)->get();
        $tools = Tool::where('resep_idresep', $request->idresep)->get();
        $ingredients = Ingredient::where('resep_idresep', $request->idresep)->get();


        $data = [];
        foreach ($recipes as $recipe) {
            $data[] = [
                'idresep' => $recipe->idresep,
                'judul' => $recipe->judul,
                'gambar' => url($recipe->gambar),
                'cara_pembuatan' => $recipe->cara_pembuatan,
                'video' => $recipe->video,
                'nama' => $recipe->user->nama,
            ];
        }
    
        RecipeView::create([
            'email' => $request->email ?? 'guest',
            'date' => now(),
            'resep_idresep' => $request->idresep
        ]);

        $recipeData = [
            'recipe' => $data,
            'tools' => $tools,
            'ingredients' => $ingredients
        ];

        return response()->json($recipeData, 200);
    }

    public function rating(Request $request){
        $validator = Validator::make($request->all(),[
            'idresep'=>'required',
            'email'=>'required|email',
            'rating'=>'required|in:1,2,3,4,5'
        ]);

        if ($validator->fails()){
            return messageError($validator->messages()->toArray());
        }

        Rating::create([
            'rating'=>$request->rating,
            'review'=>$request->review,
            'resep_idresep'=>$request->idresep,
            'email_users'=>$request->email
        ]);

       return response()->json([
            'data'=>[
                'msg'=>"rating berhasil tersimpan"
            ]
        ]);
    }
}