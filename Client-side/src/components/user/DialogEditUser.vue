<template>
  <div class="text-center">
    <v-dialog v-model="dialog" width="500" transition="dialog-top-transition">
      <v-card class="pa-md-4 mx-lg-auto">
        <h2 class="u-u">Update User</h2>
        <form>
          <v-text-field v-model="username" prepend-icon="mdi-account" label="Username" required></v-text-field>
          <v-text-field v-model="email" prepend-icon="mdi-email" label="E-mail" required></v-text-field>
          <v-text-field v-model="setPassword" prepend-icon="mdi-lock" label="Password" type="password" required></v-text-field>
          <v-select v-model="select" prepend-icon="mdi-lock-reset" :items="items" label="Role" required></v-select>
          <v-select v-if="select === 'STUDENT'" prepend-icon="mdi-account" v-model="studentSelected" :items="studentsList" label="Select Students" required></v-select>
        </form>
        <v-card-actions>
          <v-btn color="error" @click="cancel" class="hvr-grow"> Cancel </v-btn>
          <v-btn color="primary" class="hvr-grow" @click="UpdateUser"> Update </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>

  import axios from '../../axios-request.js'
  export default {
    props:['dataStudent', 'data'],
    emits:['update', 'cancel'],
    data() {
      return {
        dialog: true,
        setPassword: '',
        username: '',
        email: '',
        select: '',
        items: ["SOCIAL AFFAIR", "STUDENT"],
        studentsList : [],
        studentSelected: null,
        editID: null,
      };
    },
    methods: {
      cancel(){
        this.$emit('cancel', false);
      },
      UpdateUser(){
        let editUser = {
          'username': this.username,
          'email': this.email,
          'password': this.setPassword,
          'role': this.select,
        }
        this.$emit('update',this.editID, editUser, false);  
      },
      getAllStudent(){
        axios.get('/students').then(res =>{
          let allStudents = res.data;
          for(let student of allStudents){
            this.studentsList.push(student.first_name);
          }
        })
      },
    },
    mounted() {
      this.username = this.data.username;
      this.email = this.data.email;
      this.select = this.data.role;
      this.editID = this.data.id;
      this.getAllStudent();
      console.log(this.data);
    },
  };
</script>

<style scoped>
  form{
    padding: 20px;
  }

  .u-u{
    text-align: center;
    align-items: center;
    justify-content: center;
  }
</style>