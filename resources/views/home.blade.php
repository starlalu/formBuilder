@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

          <!--           {{ __('You are logged in!') }} -->
                    <form action=" " class="row" id="form_builder">
                    @csrf
                    <div class="col-md-12">
    <label for="text" class="form-label">Form Name:</label>
    <input type="text" class="form-control form_name"  placeholder="Form Name" name="form_name">
                   </div>
                   <div class="col-md-12 mt-3 new_fields_section" style="border:dotted;"><div class="row mb-3">
                    <div class="col-md-4 mt-3">
    <label for="text" class="form-label">Question / Label Name:</label>
    <input type="text" class="form-control question_label"  placeholder="Enter Question / Label Name" name="question_label_[1][]" id="question_label_1">
                   </div>
                    <div class="col-md-4 mt-3">
                    <label>Answer Field Type:</label> 
                    <select class="form-select mt-2 answer_type" name="answer_type_[1][]" id="answer_type_1">
                     <option value="1">Small Text Box</option>
                     <option value="2">Big Text Box</option>
                     <option value="3">Select</option>
                     <option value="4">Check Box</option>
                     <option value="5">Radio</option>
                  </select></div>
                 <div class="col-md-4 mt-5 text-left adding_rules_incriment"> 

<button type="button" class="btn btn-primary add_rules" data-form_id="1">Add Rules</button>
</div>  


<div class="col-md-12 mt-3" style="text-align: right"><button type="button" class="btn btn-info text-white add_new_form_fields">Add  New Form Fields</button></div>
</div></div>   
  <div class="col-md-12 mt-3">
  <button type="button" class="btn btn-primary submit_form">Submit</button>
  </div>
  
</form>
                </div>
            </div>

        </div>
    </div>
</div>
@endsection
