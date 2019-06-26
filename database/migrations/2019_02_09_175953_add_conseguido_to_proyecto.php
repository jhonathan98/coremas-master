<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddConseguidoToProyecto extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('proyecto', function (Blueprint $table) {
            //
            $table->double('dinero_conseguido')->default(0)->after('valor_proyecto');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('proyecto', function (Blueprint $table) {
            //
            $table->dropColumn('dinero_conseguido');
        });
    }
}
