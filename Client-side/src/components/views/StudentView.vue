<template>
  <section>
    <br>
    <br>
    <student-form @add-student="getStudents" v-if="hidForm"></student-form>
    <edit-student v-if="update_student" :data="studentInfo" @update="UpdateStudent" @cancel="cancel"></edit-student>
    <student-detail v-if="isShowDetail" @back="closeDetail" :studentInfo="studentInfo"></student-detail>
    <div v-else>
      <v-container>
        <template>
          <v-data-table :headers="headers" :items="student_list" sort-by="calories" class="elevation-1" :loading="loading" loading-text="Loading... Please wait">
            <template v-slot:top>
              <v-toolbar flat>
                <v-toolbar-title>Students</v-toolbar-title>
                <v-divider class="mx-4" inset vertical></v-divider>
                <v-spacer></v-spacer>
                <v-dialog v-model="dialogDelete" max-width="480px" transition="dialog-top-transition">
                  <v-card>
                    <br>
                    <v-card-title class="red--text">Are you sure you want to remove this student?</v-card-title><br>
                    <v-card-actions>
                      <v-spacer></v-spacer>
                      <v-btn id="action-btn" class="hvr-grow" depressed color="primary" @click="dialogDelete = false">Cancel</v-btn>
                      <v-btn id="action-btn" class="hvr-grow" depressed color="error" @click="deleteItemConfirm">YES</v-btn>
                      <v-spacer></v-spacer>
                    </v-card-actions>
                  </v-card>
                </v-dialog>
                <v-card-title >
                  <v-text-field @keyup="searchStudent" v-model="searchStudentname" class="search" append-icon="mdi-magnify" label="Search..." single-line hide-details></v-text-field> 
                </v-card-title>
              </v-toolbar>
            </template>
            <template v-slot:item.actions="{ item }">
              <v-icon small style="font-size: 20px" color="#1E88E5" class="hvr-grow" @click="editItem(item)">mdi-pencil</v-icon>
              <v-icon small style="font-size: 20px" color="#EF5350" class="hvr-grow" @click="deleteItem(item)"> mdi-delete </v-icon>
            </template>
            <template v-slot:item.showDetails="{ item }">
              <v-btn small @click="studentDetail(item)" class="hvr-grow" color="#F9A825"> Show </v-btn>
            </template>
            <template v-slot:item.image="{ item }">
              <v-img :src="imageURL+item.image" style="top: 3px" width="45" height="45" class="pa-7 secondary rounded-circle d-inline-block"></v-img>
            </template>
          </v-data-table>
        </template>
      </v-container>
    </div>
  </section>
</template>

<script>
  import axios from "../../axios-request.js";
  import StudentDetail from "./StudentDetail.vue";
  import StudentForm from "../student/StudentForm.vue";
  import EditStudent from "../student/DialogEditStudent.vue";
  export default {
    components: {
      "student-form": StudentForm,
      "edit-student": EditStudent,
      "student-detail": StudentDetail,
    },
    data: () => ({
      imageURL: 'http://127.0.0.1:8000/storage/images/',
      loading: true,
      student_list: [],
      searchStudentname: "",
      dialogDelete: false,
      studentID: null,
      update_student: false,
      studentInfo: "",
      isShowDetail: false,
      hidForm: true,
      noData: "No data available",
      headers: [
        { text: 'Profile', align: 'start', sortable: false, value: 'image'},
        { text: 'First Name', value: 'first_name'},
        { text: 'Last name', value: 'last_name'},
        { text: 'Class', value: 'class'},
        { text: 'Gender', value: 'gender'},
        { text: 'Phone', value: 'phone'},
        { text: 'Details', value: 'showDetails'},
        { text: 'Actions', value: 'actions', sortable: false},
      ],
    }),
    methods: {
      closeDetail(back) {
        this.isShowDetail = back;
        this.hidForm = true;
      },
      studentDetail(studentInfo) {
        this.isShowDetail = true;
        this.studentInfo = studentInfo;
        this.hidForm = false;
        console.log(studentInfo);
      },
      editItem(students) {
        this.update_student = true;
        this.studentInfo = students;
      },
      UpdateStudent(id, editStudent, isFalse) {
        axios.put("/students/" + id, editStudent).then((res) => {
          console.log(res.data);
          this.update_student = isFalse;
          this.getStudents();
        });
      },
      getStudents() {
        axios.get("/students").then((res) => {
          this.student_list = res.data;
          this.loading = false
        }).catch(error=>{
            this.loading = false;
            console.log(error);
        });
      },
      deleteItem(student) {
        this.dialogDelete = true;
        this.studentID = student.id;
      },
      deleteItemConfirm() {
        axios.delete("/students/" + this.studentID).then((res) => {
          console.log(res.data);
          this.getStudents();
          this.dialogDelete = false;
        });
      },
      cancel(isFalse) {
        this.update_student = isFalse;
      },
      searchStudent() {
        if (this.searchStudentname !== "") {
          axios.get("/searchStudent/search/" + this.searchStudentname).then((res) => {
            this.student_list = res.data;
          });
        } else {
          this.getStudents();
        }
      },
    },
    mounted() {
      this.getStudents();
    },
  };
</script>

<style scoped>
  .ms {
    text-align: center;
    justify-content: center;
    align-items: center;
    display: flex;
    color: grey;
  }
  section {
    margin-top: 4vh;
  }
  .text-h5 {
    color: white;
  }
  .btn-create {
    margin: 10px;
  }
  v-radio {
    display: flex;
  }
  thead {
    height: 7vh;
    font-size: 18px;
  }
  thead th {
    color: #fff;
    font-size: 15px;
  }
  tbody tr {
    height: 9vh;
    cursor: pointer;
  }
  .title {
    margin-left: -1.5%;
  }
  .t {
    margin-top: 3%;
    margin-left: -1.5%;
  }
  .search {
    margin-right: -1.5%;
    width: 11%;
  }
  #action-btn {
    margin-bottom: 20px;
  }
  #edit {
    color: rgb(59, 114, 252);
  }
  #delete {
    color: rgb(250, 56, 59);
  }
</style>