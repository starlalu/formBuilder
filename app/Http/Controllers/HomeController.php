<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\form_masters;
use App\Models\answers;
use Illuminate\Support\Facades\Auth;
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
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function forms()
    {
        $form_datas=form_masters::orderBy('id', 'ASC')->get();
    
        return view('forms',compact('form_datas'));
    }

    public function dynamicFormSubmit(Request $request)
    {
            
               foreach($request->all() as $key=>$row)
               {
                  
                   if($key=='forms_data')
                   {
                 
                       foreach($row as $key=>$row1)
                       {
                        $answer_data=new answers(); 
                        $answer_data->form_details_id=$key;
                        $answer_data->answers=$row1;
                        $answer_data->users_id = Auth::user()->id;
                        $answer_data->save();
                       }
                   }
                 
               }
               return  redirect('/forms');
            
    }


    
}
