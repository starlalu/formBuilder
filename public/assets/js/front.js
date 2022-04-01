$(document).ready(function(){
    // jQuery methods go here...

    var return_datas='';
    $(document).on('click','.add_rules',function()  {

       
        var id=$(this).attr('data-form_id');

        return_datas=rulesList($("#answer_type_"+id).val());
       
        $(this).parent().parent().after('<div class="col-md-12"><div class="row mb-3 rules_dev"><div class="col-md-1 mt-3 rules_section"></div><div class="col-md-3 mt-3 rules_section">'+
        '<label for="text" class="form-label">Select Rule:</label>'+
        '<select class="form-select rule_select rules_id_'+id+'" name="rules['+id+'][]" >'+
        return_datas+
       '</select></div>'+
        '<div class="col-md-3 mt-3 rules_section_val">'+
        '<label for="text" class="form-label">Value:</label>'+
        '<input type="text" class="form-control answer_label"  placeholder="Enter Value"  name="rules_values['+id+'][]"></div><div class="col-md-5 mt-5 text-left rules_section">'+
        '<button type="button" class="btn btn-primary add_rules" data-form_id="'+$(this).attr('data-form_id')+'">Add Rules</button> <button type="button" class="btn btn-primary remove_rules">Remove Rules</button></div></div></div>');
        

    });

    $(document).on('click','.add_new_form_fields',function() {
        //alert($('.new_fields_section').length);  
        $("#myModal .modal-body").empty();
        if($("#question_label_"+$('.new_fields_section').length).val()=="")
        {
            $("#myModal .modal-body").append('Please Enter the Question / Label Name..!');
            $("#myModal").modal('show'); 
            return false;
        }
        //alert($('.new_fields_section').length);
          if($("#answer_type_"+$('.new_fields_section').length).val()==3|| $("#answer_type_"+$('.new_fields_section').length).val()==4 || $("#answer_type_"+$('.new_fields_section').length).val()==5)
          {
              if($(".rules_id_"+$('.new_fields_section').length).length==0 || $(".rules_id_"+$('.new_fields_section').length).length==undefined)
              {
                $("#myModal .modal-body").append('Please create some rules for the selected answer field type and then add new form fields..!');
                $("#myModal").modal('show'); 
                return false;
              }
             
          
          }
        var count=$('.new_fields_section').length+1;
        $(this).parent().parent().parent().after(            
       '<div class="col-md-12 mt-4 new_fields_section" style="border:dotted;"><div class="row mb-3"><div class="col-md-4 mt-3">'+
       '<label for="text" class="form-label">Question / Label Name:</label>'+
       '<input type="text" class="form-control question_label"  placeholder="Enter Question / Label Name" name="question_label_['+count+'][]" id="question_label_'+count+'">'+
       '</div>'+
       '<div class="col-md-4 mt-3 answer_type_section">'+
       '<label>Answer Field Type:</label>'+
       '<select class="form-select mt-2 answer_type" name="answer_type_['+count+'][]" id="answer_type_'+count+'">'+
       '<option value="1">Small Text Box</option>'+
       '<option value="2">Big Text Box</option>'+
       '<option value="3">Select</option>'+
       '<option value="4">Check Box</option>'+
       '<option value="5">Radio</option>'+
       '</select></div><div class="col-sm-4 col-md-4 col-lg-4 col-xl-4 mt-5"><button type="button" class="btn btn-primary add_rules"  data-form_id="'+count+'">Add Rules</button> </div><div class="col-xs-6 col-sm-6 col-md-10 col-lg-9 col-xl-9 mt-3 mb-1" style="text-align: right"><button type="button" class="btn btn-info text-white add_new_form_fields">Add  New Form Fields</button></div><div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 col-xl-3 mt-3 mb-1" style="text-align: right"><button type="button" class="btn btn-info text-white remove_form_fields ml-2">Remove  Form Fields</button></div></div></div>');
        

    });

    $(document).on('change','.answer_type',function() {

        $(this).parent().parent().parent().find('.rules_section').remove();
        $(this).parent().parent().parent().find('.rules_section_val').remove();
      
    });

    $(document).on('click','.remove_form_fields',function() {

        $(this).parent().parent().parent().remove();
      
    });

    $(document).on('click','.remove_rules',function(){

        $(this).parent().closest('.rules_dev').remove();
      
    });

    $(document).on('change','.rule_select',function() {
       
        if($(this).val()==3 || $(this).val()==4)
        {
            $(this).parent().parent().parent().find('.rules_section_val .answer_label').attr("disabled", "disabled")
        }
        else
        {
            $(this).parent().parent().parent().find('.rules_section_val .answer_label').removeAttr("disabled");
        }
        
      
    });

    $(document).on('click','.submit_form',function(){

        $("#myModal .modal-body").empty();
        if($(".form_name").val()=="")
        {
            $("#myModal .modal-body").append('Please Enter the Form Name..!');
            $("#myModal").modal('show'); 
            return false;
        }
        $.ajax({
            type: 'POST',
            url: "api/v1/formBuilderSubmit",
            data: $("#form_builder").serialize(),
            dataType: "json",
            beforeSend: function(){
                $("#myModal .modal-body").empty();
            },
            success: function(json) { 
                if(json.status==true)
                {
                    $("#myModal .modal-body").append(json.message);
                    $("#myModal").modal('show');
                    setTimeout(() => window.location.reload(), 1000);
                
                }
                else
                { 
                    $("#myModal .modal-body").append(json.message);
                    $("#myModal").modal('show');   
                }
                
             },
             error: function (json) {
                $("#myModal .modal-body").append("We can't process your request now..!");
                $("#myModal").modal('show');   
             } 
      });

      
    });
    
     
  
  });

 

  function rulesList(rule_id) {
    var return_rules='';
    switch (parseInt(rule_id)) {
        case 1:
          return return_rules+='<option value="1">Min</option>'+
          '<option value="2">Max</option>'+
          '<option value="3">Required</option>'+
          '<option value="4">Email</option>';
          break;
        case 2:
            return return_rules+='<option value="1">Min</option>'+
            '<option value="2">Max</option>'+
            '<option value="3">Required</option>';
          break;
        case 3:
            return return_rules+='<option value="5">value</option>'+
            '<option value="3">Required</option>';
          break;
        case 4:
            return return_rules+='<option value="5">value</option>'+
            '<option value="3">Required</option>';
          break;
        case 5:
            return return_rules+='<option value="5">value</option>'+
            '<option value="3">Required</option>';
          break;
      
    }
    return return_rules;
   
  }

  function validate_user(form_id,user_id)
  {
      $.ajax({
        type: 'GET',
        url: "api/v1/validate_user/"+form_id+"/"+user_id,
        dataType: "json",
        success: function(json) {
            if(json>0)
            {
                $("#dynamic_submit_"+form_id).hide();
            }

        }
    });

  }