<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('specialty_user', function (Blueprint $table) {
            $table->id();

            // Specialty
            $table->unsignedBigInteger('specialty_id');
            // Doctor
            $table->unsignedBigInteger('user_id');

            $table->timestamps();

            // Relationships
            $table->foreign('specialty_id')->references('id')->on('specialties')
                 ->ondelete('cascade')->onupdate('cascade');
            $table->foreign('user_id')->references('id')->on('users')
                 ->ondelete('cascade')->onupdate('cascade');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('specialty_user');
    }
};
