<header>
    <div class="paddingNavbar">
        <img alt="Logo" src="/images/logoHeader.png" class="logoNavbar" />

        <!---------------------------------------- MENU desktop ---------------------------------------------------------->

        <!--sezione di navigazione -->
        <nav class="linkNavbar">
           <a href="https://www.codecrusaders.com/notifiche">
               <span class="textNavbar">Notifiche</span>
           </a>

           <a href="https://www.codecrusaders.com/account">
               <span class="textNavbar">Account</span>
           </a>
       </nav>

        <!-------------------------- MENU con logo + icona hamburger Menu (mobile) ----------------------------------------->
        <div class="navbar-burger-menu" onclick="openingMenu()">

            <!-- SVG scaricato da Google fonts -->
            <svg xmlns="http://www.w3.org/2000/svg"
                 height="48px"
                 viewBox="0 -960 960 960"
                 width="48px"
                 fill="#EFEFEF">

                <path d="M120-240v-60h720v60H120Zm0-210v-60h720v60H120Zm0-210v-60h720v60H120Z"/>
            </svg>
        </div>
    </div>

    <!-------------------------------------- MENU con link (mobile) --------------------------------->

    <nav class="navbar-links-mobile" id="myLinks">
        <a href="https://www.codecrusaders.com/notifiche">
            <span class="textNavbar">Notifiche</span>
        </a>

        <a href="https://www.codecrusaders.com/account">
            <span class="textNavbar">Account</span>
        </a>
    </nav>
   </div>

</header>

<script src="../javascript/OpeningMenuMobile.js"></script>