<template>
   <v-app class="">
       <div class="home-page">
           <div class="text">
                <h1>Welcome to our application</h1><br>
                <span class="tt">
                    Passerelles numériques is a non-profit organization under <br>  French law,
                    created in 2005, operating in three Asian countries: <br> 
                    Cambodia, the Philippines and Vietnam.
                </span><br>
                <button class="hvr-grow"><a href="#about" style="color:#fff; text-decoration: none;">About us</a></button>
           </div>
        </div>
        <div id="about" class="free">
            <h3 class="ab">Our value such as  Trust  Responsibility Solidarity Respect Demanding approach</h3>
        </div>
        <br>
        <div class="for-country">
            <div class="btn">
                <div class="pnc">
                    <img class="hvr-grow" src="../../assets/cambodia.png" alt="">
                </div>
                <div class="pnv">
                    <img class="hvr-grow" src="../../assets/pnv.png" alt="">
                </div>
                <div class="pnp">
                    <img class="hvr-grow" src="../../assets/pnp.png" alt="">
                </div>
            </div>
            <div  id="c-text">
                <div class="c">
                    <h4>Cambodia</h4>
                </div>
                <div class="v">
                    <h4>Vietnam</h4>
                </div>
                <div class="p">
                    <h4>Philippines</h4>
                </div>
            </div>
            <div  class="c-text">
                <div id="pnc">
                    <small>Passerelles numériques Cambodia was the first project to be launched in 2005, in Phnom Penh. PNC offers two IT training programs in System and Network Administration (SNA) and Web Programming (WEP), based on a holistic educative approach including technical and soft skills, and a personal development program.</small>
                </div>
                <div id="pnv">
                    <small>Passerelles numériques Vietnam (PNV) offers full scholarships to our 3-year, high-quality IT training program in: Web Development, Mobile Development & Automated Testing. Each of these specializations is taught holistically, including both technical and soft skills alongside a robust personal development program.</small>
                </div>
                <div id="pnp">
                    <small>Passerelles numériques Philippines (PNP) offers an IT training program based on a holistic educative approach including technical and soft skills, and a personal development program.</small>
                </div>
            </div>
        </div>
        <div class="in-contact" id="contact">
            <div id="all-in-contact">
                <div id="about-us">
                    <h3 style="color: #ffff;">About us </h3>
                    <small style="color: rgb(179, 176, 176);">Passerelles numériques is a non-profit organization under French  law, <br>created in 2005, operating in three Asian countries: <br>  Cambodia, the Philippines and Vietnam.</small>
                </div>
                <div id="get-in-touch">
                    <h3 style="color: #ffff;">Get in Touch</h3>
                    <small style="color: rgb(179, 176, 176);">BP 511 St. 371 Phum Tropeang Chhuk (Borey Sorla) Sangkat Tek Thla, Khan Sen Sok  Phnom Penh CAMBODIA</small><br>
                    <small style="color: rgb(179, 176, 176);">Phone: +855 23 99 55 00</small><br>
                    <small style="color: rgb(179, 176, 176);">Email: info.cambodia@passerellesnumeriques.org</small>
                </div>
                <div id="social-media">
                    <h3 style="color: #ffff;">Social Media</h3>
                    <div class="social">
                        <a class="hvr-grow" href="https://www.facebook.com/login/?next=https%3A%2F%2Fwww.facebook.com%2Fpasserelles.numeriques" target="blank"><i class="fa fa-facebook-square"></i></a>
                        <a class="hvr-grow" href="https://www.youtube.com/user/PasserellesNumerique" target="blank"><i class="fa fa-youtube"></i></a>
                        <a class="hvr-grow" href="https://www.linkedin.com/company/passerellesnum-riques/" target="blank"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            ©Copyright designed by Lyden Chai
        </footer>
   </v-app>
</template>

<style  scoped>

    .home-page{
        background-image: url('../../assets/lV9LYT.jpg');
        background-position: center;
        background-size: cover;
        display: flex;
        height: 100vh;
    }  

    .text{
        color: #fff;
        margin-left: 12%;
        margin-top: 18%;
    }
    
    .tt{
        margin-top: 4%;
        margin-left: -1%;
    }

    button{
        margin: 10px;
        width: 180px;
        height: 50px;
        border: none;
        outline: none;
        margin-left: 23%;
        margin-top: 5%;
        font-size: 20px;
        border-radius: 8px;
        cursor: pointer;
        background: #FBC02D;
    }


    .free{
        padding:1px;
        height: 67px;
        display: flex;
        text-align: center;
        justify-content: center;
        background: rgba(26, 26, 26, 0.981);
    }

    .ab{
        margin-top: 15px;
    }

    h3{
        margin-top: 10px;
        color: #fff;
    }

    .country{
        display: flex;
    }

    .for-country{
        height: 40vh;
        width: 100%;
    }

    .btn,
    .c-text{
        display: flex;
    }

    #c-text{
        display: flex;
    }
    
    .pnp,
    .pnc,
    .pnv{
        width: 33%;
        align-items: center;
        justify-content: center;
        display: flex;
    }

    #pnp,
    #pnc,
    #pnv{
        width: 33%;
        align-items: center;
        justify-content: center;
        display: flex;
        margin: 15px;
    }

    .c,
    .p,
    .v{
        width: 33%;
        align-items: center;
        justify-content: center;
        display: flex;
        margin: 15px;
    }

    img{
        width: 150px;
        height: 80px;
    }

    .in-contact{
        width: 100%;
        display: flex;
        background: rgba(26, 26, 26, 0.981);
    }

    #all-in-contact{
        display: flex;
        align-items: center;
        justify-content: center;
        display: flex;
    }

    #about-us,
    #get-in-touch,
    #social-media{
        margin: 30px;
    }

    #about-us{
        width: 33%;
    }

    #get-in-touch{
        width: 33%;
    }

    .social-media{
        width: 33%;
    }

    .social > a > i {
        padding: 10px;
        font-size: 40px;
        color: rgb(41, 198, 219);
    }

    footer{
        height: 40px;
        display: flex;
        color: #ffff;
        text-align: center;
        align-items: center;
        justify-content: center;
        background: rgb(41, 198, 219);
    }

</style>