<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Proyecto;
use App\Models\Clasificado;
use App\User;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //Traer todos los proyectos de la base de datos tabla proyecto 
        $proyecto = Proyecto::orderBy('updated_at','desc')->get();
        $clasificado = Clasificado::orderBy('updated_at','desc')->get();
        return view('home',compact('proyecto','clasificado'));
    }
}
