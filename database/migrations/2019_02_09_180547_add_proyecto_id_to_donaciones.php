<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddProyectoIdToDonaciones extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('donaciones', function (Blueprint $table) {
            //
            $table->unsignedInteger('proyecto_id')->after('estado');
            $table->foreign('proyecto_id')->references('id')->on('proyecto');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('donaciones', function (Blueprint $table) {
            //
            $table->dropForeign('donaciones_proyecto_id_foreign');
            $table->dropColumn('proyecto_id');

        });
    }
}
