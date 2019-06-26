<?php

namespace App\Models;
use App\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Proyecto extends Model
{
    //
    //Tabla base de datos
    public $table = 'proyecto';
    use SoftDeletes; //Al borar queda guardado pero con deleted at

    const CREATED_AT = 'created_at';
    const UPDATED_AT = 'updated_at';


    protected $dates = ['deleted_at'];


    public $fillable = [
        'nombre_proyecto',
        'descripcion_proyecto',
        'fase_proyecto',
        'publico_objetivo',
        'problema_proyecto',
        'solucion_proyecto',
        'ventaja_proyecto',
        'propuesta_proyecto',
        'costos_proyecto',
        'valor_proyecto',
        'plazo_financiacion',
        'video_proyecto',
        'descripcion_extra',

    ];

    public function usuarios()
    {
        //Pertenece a un unico usuario
        return $this->belongsTo(User::class);
    }

    
    
}
