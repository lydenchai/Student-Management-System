<template>
  <div class="">
    <v-dialog v-model="dialog" width="400" transition="dialog-top-transition">
      <template v-slot:activator="{ on, attrs }" class="create-user-btn">
        <v-btn color="red darken-1" dark class="hvr-grow" v-bind="attrs" v-on="on" bottom fab fixed right> + </v-btn>
      </template>
      <v-card>
        <form>
          <h1>Students Score</h1> <br>
          <div class="s-student">
            <v-combobox label="Choose a student" v-model="studentSelected" :items="studentsList" item-text="first_name">
              <template v-slot:item="data">
                <v-list-item-avatar>
                  <img :src="imageURL + data.item.image"/>
                </v-list-item-avatar>
                <v-list-item-content>
                  <v-list-item-title v-html=" data.item.first_name + ' ' + data.item.last_name"></v-list-item-title>
                  <v-list-item-subtitle v-html="data.item.class"></v-list-item-subtitle>
                </v-list-item-content>
              </template>
            </v-combobox>
          </div>
          <div class="t-input">
            <div class="left">
              <label for="score">HTML / CSS</label>
                <input type="number" name="" id="" min="0" max="100" v-model="htmlcss">
              <label for="score">JavaScript</label>
                <input type="number" name="" id="" min="0" max="100" v-model="javascript">
              <label for="score">Python</label>
                <input type="number" name="" id="" min="0" max="100" v-model="python">
            </div>
            <div class="right">
              <label for="score">PHP</label>
                <input type="number" name="" id="" min="0" max="100" v-model="php">
              <label for="score">laravel</label>
                <input type="number" name="" id="" min="0" max="100" v-model="laravel">
              <label for="score">Java</label>
                <input type="number" name="" id="" min="0" max="100" v-model="java">
            </div>
          </div>
          <p>{{ errorMessage }}</p>
          <v-card-actions>
            <v-btn color="error" class="hvr-grow" @click="dialog = false"> Cancel</v-btn>
            <v-btn color="primary" class="hvr-grow" @click="createStudentScore">Create</v-btn>
          </v-card-actions> 
        </form>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
  import axios from '../../axios-request.js'
  export default {
    emits:['add-score'],
    data: () => ({
      studentSelected:null,
      studentsList: [],
      dialog : false,
      htmlcss: null,
      javascript: null,
      python: null,
      php: null,
      laravel: null,
      java: null,
      errorMessage: "",
      combobox: null,
      imageURL: "http://127.0.0.1:8000/storage/images/",
    }),
    methods: {
      getAllStudent(){
        axios.get('/students').then(res =>{
          this.studentsList = res.data;
        })
      },
      createStudentScore(){
        let newScore = {
          'student_id': this.studentSelected.id,
          'htmlcss': this.htmlcss,
          'javascript': this.javascript,
          'python': this.python,
          'php': this.php,
          'laravel': this.laravel,
          'java': this.java,
        }
        axios.post('/score', newScore).then(res=>{
          this.$emit("add-score", res.data);
          this.dialog = false;
        }).catch((error) => {
          console.log(error);
          this.errorMessage = "Oops! You must fill in all fields";
        });
        this.htmlcss = "";
        this.javascript = "";
        this.python = "";
        this.php = "";
        this.laravel = "";
        this.java = "";
        this.combobox = "";
        this.studentSelected = null;
      },
      cancelCreate(){
        this.dialog = false;
        this.errorMessage = "";
        this.htmlcss = "";
        this.javascript = "";
        this.python = "";
        this.php = "";
        this.laravel = "";
        this.java = "";
        this.studentSelected = null;
        this.combobox = "";

      },
    },
    mounted() {
      this.getAllStudent();
    },
  }
</script>

<style scoped>
  h1{
      margin-left: 18%;
  }
  
  .create-user-btn {
    top: 85vh;
    float: right;
    position: fixed;
  }

  form{
    padding: 15px;
    width: 100%;
  }

  p{
    color: red;
    text-align: center;
  }

  .selected,input[type=number]{
    width: 100%;
    background: rgba(191, 190, 190, 0.809);
    border-radius: 2px;
    height: 35px;
    padding: 0 5px;
    color: rgb(49, 47, 47);
    margin-bottom: 10px;
    border: none;
  }

  .s-student{
    padding: 10px;
  }

  .t-input{
    display: flex;
  }

  .left,
  .right{
    padding: 10px;
    width: 50%;
  }

  input, select{
    border: none;
    outline: none;
  }

</style>