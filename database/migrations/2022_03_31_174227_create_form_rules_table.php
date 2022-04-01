<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormRulesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('form_rules', function (Blueprint $table) {
             $table->id();
            $table->integer('form_details_id')->unsigned();
            $table->string('rules_type')->nullable();
            $table->string('value')->nullable();
            $table->foreign('form_details_id')->references('id')->on('form_details')->onDelete('cascade');
            $table->timestamps(); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('form_rules');
    }
}
