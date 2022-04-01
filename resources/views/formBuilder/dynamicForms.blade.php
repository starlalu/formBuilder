<form method="POST" action="{{ route('dynamicFormSubmit') }}" class="row" >
    @csrf   
        @php 
        $rules='';
        $type='';
        $datas=[];
       
            foreach($row->form_details as $row2)
              {
                  if($row2->answer_type=='1')
                  {
                      foreach($row2->form_rules as $row3)
                       {
                          if($row3->rules_type==1)
                          {
                            $rules.='';
                            $rules.='minlength='.$row3->value.'';
                            $type='text';
                          }
                          else if($row3->rules_type==2)
                          {
                            $rules.=' ';
                            $rules.='maxlength='.$row3->value.'';
                            $type='text';
                          }
                          else if($row3->rules_type==3)
                          {
                            $rules.=' ';
                            $rules.='required';
                            $type='text';
                          }
                          else if($row3->rules_type==4)
                          {
                            $type='email';
                          }
                         
                       }
                      @endphp
                      
                      <div class="col-md-12 mt-3">
                      <label for="text" class="form-label"> {{ $row2->questions }}:</label>
                      <input type="{{$type}}" class="form-control form_name"  placeholder=" " name="forms_data[{{$row2->id}}]" {{$rules}}>
                      </div>
                     
                    @php } @endphp

                    @php
                    if($row2->answer_type=='2')
                  {
                      foreach($row2->form_rules as $row3)
                       {
                          if($row3->rules_type==1)
                          {
                            $rules.=' ';
                            $rules.='minlength='.$row3->value.'';
                          }
                          else if($row3->rules_type==2)
                          {
                            $rules.=' ';
                            $rules.='maxlength='.$row3->value.'';
                          }
                          else if($row3->rules_type==3)
                          {
                            $rules.=' ';
                            $rules.='required';
                          }
                          
                         
                       }
                      @endphp
                      
                      <div class="col-md-12 mt-3">
                      <label for="text" class="form-label"> {{ $row2->questions }}:</label>
                      <textarea class="form-control" rows="10" id="comment" name="forms_data[{{$row2->id}}]" {{$rules}}></textarea>
                      </div>
                     
                    @php } @endphp

                    @php
                
                    if($row2->answer_type=='3')
                  {
                      foreach($row2->form_rules as $row3)
                       {
                          if($row3->rules_type==5)
                          {
                            $rules.=' ';
                            $datas[]=$row3->value;
                          }
                          else if($row3->rules_type==3)
                          {
                            $rules.=' ';
                            $rules.='required';
                          }
                         
                       }
                       
                      @endphp
                       
                      <div class="col-md-12 mt-3">
                     
                    <label>{{ $row2->questions }}: </label> 
                    <select class="form-select mt-2 answer_type" name="forms_data[{{$row2->id}}]" id="answer_type_1" {{$rules}}>
                
                        @foreach($datas as $row4)
                
                    <option value="{{$row4}}">{{$row4}}</option>
                    
                        @endforeach
                   
                    
                  </select>
                      </div>
                     
                    @php } @endphp


                    @php
                
                if($row2->answer_type=='4')
                 {
                  foreach($row2->form_rules as $row3)
                   {
                      if($row3->rules_type==5)
                      {
                        $rules.=' ';
                        $datas[]=$row3->value;
                      }
                      else if($row3->rules_type==3)
                      {
                        $rules.=' ';
                        $rules.='required';
                      }
                     
                   }
                   
                  @endphp
                   
                <div class="col-md-4 mt-3">
                <label>{{ $row2->questions }}:</label> 
                </div>
                <div class="col-md-8 mt-3">
                @foreach($datas as $row4)
                <div class="form-check">
      <input type="checkbox" class="form-check-input" id="{{$row4}}" name="forms_data[{{$row2->id}}]" value="{{$row4}}">
      <label class="form-check-label" for="{{$row4}}">{{ $row4 }}</label>
                 </div>
                 @endforeach
                  </div>
                 
                @php } @endphp


                @php
                
                if($row2->answer_type=='5')
                 {
                    $datas=[];
                  foreach($row2->form_rules as $row3)
                   {
                      if($row3->rules_type==5)
                      {
                        $rules.=' ';
                        $datas[]=$row3->value;
                      }
                      else if($row3->rules_type==3)
                      {
                        $rules.=' ';
                        $rules.='required';
                      }
                     
                   }
                   
                  @endphp
                   
                <div class="col-md-4 mt-3">
                <label>{{ $row2->questions }}:</label> 
                </div>
                <div class="col-md-8 mt-3">
                @foreach($datas as $row4)
                <div class="form-check">

  <input type="radio" class="form-check-input" id="{{$row4}}" name="forms_data[{{$row2->id}}]" value="{{$row4}}" >
  <label class="form-check-label" for="{{ $row4 }}">{{ $row4 }}</label>
                 </div>
                 @endforeach
                  </div>
                 
                @php } @endphp


                 
                 @php   } @endphp
        
                 <button type="submit" class="btn btn-primary mt-3" id="dynamic_submit_{{ $row->id }}">Submit</button>
  
        </form>