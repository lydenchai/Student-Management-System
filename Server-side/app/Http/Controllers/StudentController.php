<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Student;

class StudentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Student::with('permission', 'disciple', 'score')->latest()->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'class' => 'required',
            'phone' => 'required',
            'gender' => 'required',
            'image' => 'nullable|image|mimes:jpg,jpeg,png,gif,jfif|max:1999'
        ]);
        $request->file('image')->store('public/images');
        $student = new Student();
        $student->first_name = $request->first_name;
        $student->last_name = $request->last_name;
        $student->class = $request->class;
        $student->phone = $request->phone;
        $student->gender = $request->gender;
        $student->image = $request->file('image')->hashName();
        $student->save();
        return response()->json([
            'Message' => 'Created',
            'data' => $student,
        ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Student::with('permission', 'disciple', 'score')->findOrFail($id);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'class' => 'required',
            'phone' => 'required',
            'gender' => 'required',
        ]);
        $student = Student::findOrFail($id);
        $student->first_name = $request->first_name;
        $student->last_name = $request->last_name;
        $student->class = $request->class;
        $student->phone = $request->phone;
        $student->gender = $request->gender;
        $student->save();
        return response()->json([
            'Message' => 'Updated',
            'data' => $student
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $isDeleted = Student::destroy($id);
        if ($isDeleted == 1) {
            return response()->json(['massage' => 'Deleted'], 200);
        } else {
            return response()->json(['massage' => 'Not Found'], 404);
        }
    }

    public function searchStudent($studentname)
    {
        return Student::where('first_name', 'like', '%' . $studentname . '%')->with('permission', 'disciple', 'score')->get();
    }
}
