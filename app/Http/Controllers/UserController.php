<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Recipe;
use App\Models\Tool;
use App\Models\Ingredient;

class UserController extends Controller
{
    public function create_recipe(Request $request){

        $validator = Validator::make($request->all(),[
            'judul'=>'required|max:255',
            'gambar'=>'required|mimes:png,jpg,jpeg|max:2048',
            'cara_pembuatan'=>'required',
            'video'=>'required',
            'users_email'=>'required',
            'bahan'=>'required',
            'alat'=>'required'
        ]);

        if ($validator->fails()){
            return messageError($validator->messages()->toArray());
        }

        $thumbail = $request->file('gambar');
        $filename = now()->timestamp."_".$request->gambar->getClientOriginalName();
        $thumbail->move('uploads',$filename);

        $recipeData = $validator->validated();

        $recipe = Recipe::create([
            'judul' => $recipeData['judul'],
            'gambar' => 'uploads/'.$filename,
            'cara_pembuatan' => $recipeData['cara_pembuatan'],
            'video' => $recipeData['video'],
            'users_email' => $recipeData['users_email'],
            'status_resep' => 'submit'
        ]);

        foreach(json_decode($request->bahan) as $bahan){
            Ingredient::create([
                'nama' => $bahan->nama,
                'satuan' => $bahan->satuan,
                'banyak' => $bahan->banyak,
                'keterangan' => $bahan->keterangan,
                'resep_idresep' => $recipe->id
            ]);
        }

        foreach(json_decode($request->alat) as $alat){
            Tool::create([
                'nama_alat' => $alat->nama,
                'keterangan' => $alat->keterangan,
                'resep_idresep' => $recipe->id
            ]);
        }

        return response()->json([
            "data"=> [
                "msg"=>"resep berhasil disimpan",
                "resep"=> $recipeData['judul']
            ]
        ],200);
    }
}
