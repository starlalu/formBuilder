<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFormDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('form_details', function (Blueprint $table) {
            $table->id();
            $table->integer('form_id')->unsigned();
            $table->string('question_id');
            $table->text('questions')->nullable();
            $table->string('answer_type')->nullable();
            $table->foreign('form_id')->references('id')->on('form_masters')->onDelete('cascade');
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
        Schema::dropIfExists('form_details');
    }
}
