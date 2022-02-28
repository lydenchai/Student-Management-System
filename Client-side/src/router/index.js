import Vue from 'vue'
import VueRouter from 'vue-router'
import Signin from '../components/authentication/Sign_in.vue';
import Home from '../components/views/HomeView.vue';
import Users from '../components/views/UsersView.vue';
import Students from '../components/views/StudentView.vue';
import StudentInfo from '../components/views/StudentInfo.vue';
import Permission from '../components/views/PermissionView.vue';
import Disciples from '../components/views/DiscipleView.vue';
import Score from '../components/views/ScoreView.vue';

Vue.use(VueRouter)
const routes = [
  {
    path: '/Signin',
    component: Signin
  },
  {
    path: '/',
    component: Signin
  },
  {
    path: '/home',
    component: Home
  },
  {
    path: '/user',
    component: Users
  },
  {
    path: '/students',
    component: Students
  },
  {
    path: '/score',
    component: Score
  },
  {
    path: '/studentInfo',
    component: StudentInfo
  },
  {
    path: '/permission',
    component: Permission
  },
  {
    path: '/disciples',
    component: Disciples
  },
]

const router = new VueRouter({
  base: process.env.BASE_URL,
  routes
})
export default router