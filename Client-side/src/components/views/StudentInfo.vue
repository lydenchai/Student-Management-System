<template>
    <v-container>
        <br>
        <br>
        <br>
        <div class="detail-card">
            <div class="profile">
                <img :src="imageURL+studentInfo.image" />
            </div>
            <div class="name">
                <v-col>
                    <div class="first_name">
                        <span>Name: <strong>{{studentInfo.first_name}} {{studentInfo.last_name}}</strong></span>
                    </div>
                    <div class="gender">
                        <span><small>Sex: {{studentInfo.gender}}</small></span>
                    </div>
                    <div class="gender">
                        <span><small>Phone: {{studentInfo.phone}}</small></span>
                    </div>
                </v-col>
            </div>
            <div class="class">
                 <v-list-item>
                    <v-icon>mdi-theater</v-icon>
                    <span><v-list-item-title>{{studentInfo.class}}</v-list-item-title></span>
                </v-list-item>
            </div>
            <div class="school">
                <div v-if="numOfDisciples > 0">
                    <v-list-item>
                        <div v-if="terminate" id="dd" >
                            <v-icon  class="red--text">mdi-cancel</v-icon>
                            <span class="red--text ">Out School</span>             
                        </div>
                        <div v-else>
                            <v-icon class="green--text">mdi-school</v-icon>
                            <span class="green--text">At School</span> 
                        </div>
                    </v-list-item>
                </div>
                <div v-else class="schooll">
                    <v-icon  class="green--text">mdi-school</v-icon>
                    <span class="green--text">At School</span>     
                </div>
            </div>
        </div><br>
        <template>
            <v-toolbar>
                <v-tabs dark class="tb" grow>
                    <v-tab @click="showPer">
                        <v-badge color="green" :content="numOfPermissions"> Permission </v-badge>
                    </v-tab>
                    <v-tab @click="showDisc">
                        <v-badge color="pink" :content="numOfDisciples"> Discipline </v-badge>
                    </v-tab>
                    <v-tab @click="showScore">
                        <h4 color="pink" > Grades </h4>
                    </v-tab>  
                </v-tabs>
            </v-toolbar>
            <template>
                <v-expansion-panels v-if="isPermission"  id="cardItem">
                    <div v-if="numOfPermissions == 0">
                        <br>
                        <h2 class="grey--text">{{nodata}}</h2>
                    </div>
                    <v-expansion-panel  class="blue-grey lighten-5" v-for="(item,i) in perEachStudentList" :key="i">
                       <v-expansion-panel-header>
                            <div class="sign">
                                <v-icon style="font-size: 40px">mdi-pill</v-icon>
                            </div>
                            <span class="date">{{item.star_tAt}} to {{item.end_At}}</span><br><br>
                            <div class="days">
                                <div v-if="item.type === 'Unauthorize' ">
                                    <strong style="margin-left: 4%">Amount: </strong><span v-html="Math.round(((new Date(item.end_At)).getTime() - (new Date(item.start_At)).getTime()) / (1000 * 3600 * 24))" ></span> <span>days</span>
                                </div>
                                <div v-else>
                                    <strong>Amount: </strong><span v-html="Math.round(((new Date(item.end_At)).getTime() - (new Date(item.start_At)).getTime()) / (1000 * 3600 * 24))" ></span> <span>days</span>
                                </div>
                            </div>
                            <div>
                                <v-col v-if="item.type === 'Unauthorize' "> 
                                    <strong style="margin-left: 4%" class="red--text" >{{item.type}}</strong>
                                </v-col>
                                <v-col v-else> 
                                    <strong class="green--text">{{item.type}}</strong>
                                </v-col>
                            </div>
                        </v-expansion-panel-header>
                        <v-expansion-panel-content class="detail">
                            <strong>Reasons:</strong><br>{{item.description}}
                        </v-expansion-panel-content>  
                    </v-expansion-panel>
                </v-expansion-panels>
                <v-expansion-panels v-if="isDisciple" id="cardItem">
                    <div v-if="numOfDisciples == 0">
                        <br>
                        <h2 class="grey--text">{{noDiscipledata}}</h2>
                    </div>
                    <v-expansion-panel class="blue-grey lighten-5" v-for="(item,i) in discEachStudentList" :key="i">
                        <v-expansion-panel-header>
                            <v-icon v-if="item.type === 'Warning letter'" style="font-size: 40px; color: #FFC107;">mdi-alert</v-icon>
                            <strong v-if="item.type === 'Warning letter'" style="color: #FFC107;">{{item.type}}</strong>
                            <v-icon v-if="item.type === 'Termination'" class="red--text" style="font-size: 40px">mdi-close-circle</v-icon>
                            <strong v-if="item.type === 'Termination'" class="red--text">{{item.type}}</strong>
                            <v-icon v-if="item.type === 'Oral warning'" class="blue--text" style="font-size: 40px">mdi-alert-octagram</v-icon>
                            <strong v-if="item.type === 'Oral warning'" class="blue--text">{{item.type}}</strong>
                            <v-icon v-if="item.type === 'Notation'" class="black--text" style="font-size: 40px">mdi-alert-box</v-icon>
                            <strong v-if="item.type === 'Notation'" class="black--text">{{item.type}}</strong>
                            <span>{{getGoodDatetimeFormat(item.date)}}</span><br><br>
                        </v-expansion-panel-header>
                        <v-expansion-panel-content class="detail">
                            <strong>Reasons:</strong><br>{{item.description}}
                        </v-expansion-panel-content>
                    </v-expansion-panel>
                </v-expansion-panels>  
                <v-expansion-panels v-if="isScore" id="cardItem"><br><br>
                    <table>
                        <thead>
                            <th>Subject</th>
                            <th class="grade1">Score</th>
                            <th class="grade1">Grade</th>
                        </thead>
                        <tbody  v-for="(score, index) in listScore" :key="index">
                            <tr>
                                <td class="subject">HTML / CSS</td>
                                <td class="grade2">{{score.htmlcss}}</td>
                                <div v-if="score.htmlcss > 89">
                                    <td class="gradeA">A</td>
                                </div>
                                <div v-else-if="score.htmlcss > 79">
                                    <td class="gradeA">B</td>
                                </div>
                                <div v-else-if="score.htmlcss > 69">
                                    <td class="gradeA">C</td>
                                </div>
                                <div v-else-if="score.htmlcss > 59">
                                    <td class="gradeA">D</td>
                                </div>
                                <div v-else-if="score.htmlcss > 49">
                                    <td class="gradeE">E</td>
                                </div>
                                <div v-else>
                                    <td class="gradeF">F</td>
                                </div>                                
                            </tr>
                              <tr>
                                <td class="subject">JavaScript</td>
                                <td class="grade2">{{score.javascript}}</td>
                                <div v-if="score.javascript > 89">
                                    <td class="gradeA">A</td>
                                </div>
                                <div v-else-if="score.javascript > 79">
                                    <td class="gradeA">B</td>
                                </div>
                                <div v-else-if="score.javascript > 69">
                                    <td class="gradeA">C</td>
                                </div>
                                <div v-else-if="score.javascript > 59">
                                    <td class="gradeA">D</td>
                                </div>
                                <div v-else-if="score.javascript > 49">
                                    <td class="gradeE">E</td>
                                </div>
                                <div v-else>
                                    <td class="gradeF">F</td>
                                </div> 
                            </tr>
                            <tr>
                                <td class="subject">Java</td>
                                <td class="grade2">{{score.java}}</td> 
                                <div v-if="score.java > 89">
                                    <td class="gradeA">A</td>
                                </div>
                                <div v-else-if="score.java > 79">
                                    <td class="gradeA">B</td>
                                </div>
                                <div v-else-if="score.java > 69">
                                    <td class="gradeA">C</td>
                                </div>
                                <div v-else-if="score.java > 59">
                                    <td class="gradeA">D</td>
                                </div>
                                <div v-else-if="score.java > 49">
                                    <td class="gradeE">E</td>
                                </div>
                                <div v-else>
                                    <td class="gradeF">F</td>
                                </div> 
                            </tr>
                            <tr>
                                <td class="subject">Python</td>
                                <td class="grade2">{{score.python}}</td>
                                <div v-if="score.python > 89">
                                    <td class="gradeA">A</td>
                                </div>
                                <div v-else-if="score.python > 79">
                                    <td class="gradeA">B</td>
                                </div>
                                <div v-else-if="score.python > 69">
                                    <td class="gradeA">C</td>
                                </div>
                                <div v-else-if="score.python > 59">
                                    <td class="gradeA">D</td>
                                </div>
                                <div v-else-if="score.python > 49">
                                    <td class="gradeE">E</td>
                                </div>
                                <div v-else>
                                    <td class="gradeF">F</td>
                                </div> 
                            </tr>
                            <tr>
                                <td class="subject">PHP</td>
                                <td class="grade2">{{score.php}}</td>  
                                <div v-if="score.php > 89">
                                    <td class="gradeA">A</td>
                                </div>
                                <div v-else-if="score.php > 79">
                                    <td class="gradeA">B</td>
                                </div>
                                <div v-else-if="score.php > 69">
                                    <td class="gradeA">C</td>
                                </div>
                                <div v-else-if="score.php > 59">
                                    <td class="gradeA">D</td>
                                </div>
                                <div v-else-if="score.php > 49">
                                    <td class="gradeE">E</td>
                                </div>
                                <div v-else>
                                    <td class="gradeF">F</td>
                                </div>                             
                            </tr>
                            <tr>
                                <td class="subject">Laravel</td>
                                <td class="grade2">{{score.laravel}}</td>
                                 <div v-if="score.laravel > 89">
                                    <td class="gradeA">A</td>
                                </div>
                                <div v-else-if="score.laravel > 79">
                                    <td class="gradeA">B</td>
                                </div>
                                <div v-else-if="score.laravel > 69">
                                    <td class="gradeA">C</td>
                                </div>
                                <div v-else-if="score.laravel > 59">
                                    <td class="gradeA">D</td>
                                </div>
                                <div v-else-if="score.laravel > 49">
                                    <td class="gradeE">E</td>
                                </div>
                                <div v-else>
                                    <td class="gradeF">F</td>
                                </div>  
                            </tr>
                            <tr>
                                <td class="total">Total</td>
                                <td>{{ (( score.htmlcss + score.javascript + score.python + score.php + score.laravel + score.java)) }}</td>
                                <div v-if="(( score.htmlcss + score.javascript + score.python + score.php + score.laravel + score.java)/6) > 89">
                                    <td class="gradea">A</td>
                                </div>
                                <div v-else-if="(( score.htmlcss + score.javascript + score.python + score.php + score.laravel + score.java)/6) > 79">
                                    <td class="gradeb">B</td>
                                </div>
                                <div v-else-if="(( score.htmlcss + score.javascript + score.python + score.php + score.laravel + score.java)/6) > 69">
                                    <td class="gradec">C</td>
                                </div>
                                <div v-else-if="(( score.htmlcss + score.javascript + score.python + score.php + score.laravel + score.java)/6) > 59">
                                    <td class="graded">D</td>
                                </div>
                                <div v-else-if="(( score.htmlcss + score.javascript + score.python + score.php + score.laravel + score.java)/6) > 49">
                                    <td class="gradee">E</td>
                                </div>
                                <div v-else>
                                    <td class="gradef">F</td>
                                </div>
                            </tr>
                        </tbody>
                    </table>
                </v-expansion-panels>                   
            </template>
        </template>
    </v-container>
</template>

<script>
import axios from "../../axios-request.js";
import moment from "moment";
export default {
  data: () => ({
    imageURL: "http://127.0.0.1:8000/storage/images/",
    student_list: [],
    searchStudentname: "",
    studentID: "",
    studentInfo: "",
    perEachStudentList: [],
    perList: [],
    discEachStudentList: [],
    numOfPermissions: "0",
    numOfDisciples: "0",
    isPermission: true,
    isDisciple: false,
    isScore: false,
    terminate: false,
    listScore: [],
    userID: "",
    nodata: "No data on Permission",
    noDiscipledata: "No data on discipline",
  }),
  methods: {
    showPer() {
      this.isPermission = true;
      this.isDisciple = false;
      this.isScore = false;
    },
    showDisc() {
      this.isPermission = false;
      this.isDisciple = true;
      this.isScore = false;
    },
    showScore() {
      this.isPermission = false;
      this.isDisciple = false;
      this.isScore = true;
    },
    getGoodDatetimeFormat(datetime) {
      return moment(String(datetime)).format("DD-MMM-Y");
    },
    back() {
      this.$emit("back", false);
    },
    getNumD() {
      for (let i in this.perEachStudentList) {
        this.numOfPermissions++;
        console.log(i);
      }
      for (let u of this.discEachStudentList) {
        this.numOfDisciples++;
        if (u.type == "Termination") {
          this.terminate = true;
        }
      }
    },
    getStudentInfo() {
      axios.get("/students/" + this.studentID).then((res) => {
        this.studentInfo = res.data;
        this.perEachStudentList = res.data.permission;
        this.discEachStudentList = res.data.disciple;
        this.listScore = res.data.score;
        console.log(res.data);
        this.getNumD();
      });
    },
  },
  mounted() {
    this.userID = localStorage.getItem("UserID");
    axios.get("/getUserByID/" + this.userID).then((res) => {
      this.studentID = res.data.student_id;
      console.log(res.data);
      this.getStudentInfo();
    });
    this.getNumD();
  },
};
</script>

<style scoped>
#cardItem {
  width: 75.5%;
  margin-left: 10%;
  margin-top: 7px;
}

#dd {
  margin-left: -2%;
}

.tb {
  background: #37474f;
  box-shadow: 0px 3px 8px 1px rgba(148, 146, 146, 0.768);
}

.v-toolbar {
  width: 75.5%;
  margin-left: 10%;
}

.btn {
  width: 80px;
  height: 5vh;
  border-radius: 5px;
}

.detail-card {
  margin-top: 10px;
  width: 75%;
  height: 18vh;
  border-radius: 3px;
  display: flex;
  margin-left: 10%;
  background: rgb(255, 255, 255);
  align-items: center;
  justify-content: center;
  box-shadow: 0px 2px 5px 2px rgba(0, 0, 0, 0.25);
}

.detail {
  background: rgb(255, 255, 255);
}

.profile {
  width: 20%;
}

.name {
  margin-top: 2.5%;
  margin-left: 5%;
}

.name,
.class,
.school {
  width: 25%;
  margin-top: 5px;
}

.class,
.school {
  margin-top: -5%;
}

.schooll {
  margin-top: -2%;
}

img {
  width: 110px;
  height: 120px;
  margin-left: 5%;
  margin-top: 4%;
}

.sign {
  margin-left: 30px;
}

.date,
.days {
  margin-right: 40px;
}

.tb {
  background: #37474f;
  box-shadow: 0px 3px 8px 1px rgba(148, 146, 146, 0.768);
}

table {
  border-collapse: collapse;
  border: 1px solid #000;
  width: 100%;
}
th,
tr,
td {
  border: 1px solid rgb(8, 8, 8);
  color: black;
  text-align: center;
  padding: 4.5px;
}

th {
  background: rgb(58, 202, 255);
  color: #fff;
  font-size: 20px;
}

.gradeA {
  background: rgb(36, 233, 108);
  color: #000;
  width: 10%;
  border: none;
  outline: none;
}
.gradeE {
  background: rgb(233, 187, 36);
  color: #000;
  width: 10%;
  border: none;
  outline: none;
}
.gradeF {
  background: rgb(255, 43, 43);
  color: #000;
  width: 10%;
  border: none;
  outline: none;
}

.gradea {
  color: rgb(225, 67, 67);
  width: 10%;
  border: none;
  outline: none;
}
.gradeb {
  color: rgb(187, 59, 72);
  width: 10%;
  border: none;
  outline: none;
}
.graded {
  color: rgb(71, 235, 84);
  width: 10%;
  border: none;
  outline: none;
}
.gradec {
  color: rgb(184, 58, 58);
  width: 10%;
  border: none;
  outline: none;
}
.gradee {
  color: rgb(32, 110, 255);
  width: 10%;
  border: none;
  outline: none;
}
.gradef {
  color: rgb(0, 0, 0);
  width: 10%;
  border: none;
  outline: none;
}

.grade1 {
  width: 10%;
}

.total {
  background: rgb(255, 255, 255);
  font-weight: bold;
  font-size: 20px;
}
</style>