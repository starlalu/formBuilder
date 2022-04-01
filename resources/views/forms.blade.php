@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row ">

        @php 
        
        foreach($form_datas as $row)
        {      
        @endphp
        <div class="col-md-6 mt-3">
            
        <button data-bs-toggle="collapse" data-bs-target="#w_{{ $row->id }}" style="width:100%;" class="btn btn-primary" onclick="validate_user({{$row->id}},{{Auth::user()->id}})">{{ $row->form_name }}</button>
        <div id="w_{{ $row->id }}" class="collapse">
        @include('formBuilder.dynamicForms')
        </div>
        </div>
        

        @php } @endphp
    </div>
</div>
@endsection
