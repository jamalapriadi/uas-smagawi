<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Migrations\Migration;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UserTableSeeder::class);
        DB::table('admin')->delete();

        $data=array(
        	'name'=>'Jamal Apriadi',
        	'email'=>'jamal.apriadi@gmail.com',
        	'password'=>Hash::make('jamal123')
        );

        DB::table('users')->insert($data);
    }
}
