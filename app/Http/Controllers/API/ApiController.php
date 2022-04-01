<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\form_masters;
use App\Models\form_details;
use App\Models\form_rules;
use App\Models\answers;
use Illuminate\Support\Facades\Auth;
class ApiController extends Controller
{
    //
      public function formBuilderSubmit(Request $request)
      {
         

          try{

            $form_master= new form_masters();
            $form_master->form_name = $request->form_name;
            $form_master->save();
            $form_master->id;
            for($i=1;$i<=count($request->question_label_);$i++)
            {
                $form_details=new form_details();
                $form_details->form_id=$form_master->id;
                $form_details->question_id=$i;
                $form_details->questions=$request->question_label_[$i][0];
                $form_details->answer_type=$request->answer_type_[$i][0];
                $form_details->save();
                 
                if(!empty($request->rules[$i]))
                {
                    for($j=0;$j<count($request->rules[$i]);$j++)
                    {
                        $form_rules=new form_rules(); 
                        $form_rules->form_details_id=$form_details->id;
                        $form_rules->rules_type=$request->rules[$i][$j];
                        $form_rules->value=empty($request->rules_values[$i][$j]) ? '' : $request->rules_values[$i][$j];
                        $form_rules->save();
                    }
                  
                }
               
            }  
           
          $msg='New Forms Created..!';
          $status=true;
        }
        catch(Exception $e)
        {
            $msg=$e->getMessage();  
            $status=false;
        }
          return response()->json(['status'  => $status, 'message' => $msg]);
      }

      public function validate_user($form_id,$user_id)
      {

        $total=answers::where('users_id',$user_id)->where('form_details_id',$form_id)->count();
        if($total==0)
        {
            $form_master=form_masters::where('id',$form_id)->first();
            $form_master->form_opened=$form_master->form_opened+1;
            $form_master->save(); 
           
           
            
        }
        echo json_encode($total);
      
       



      }

     
}
