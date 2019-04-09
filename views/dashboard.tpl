<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style/dashboard.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,400i,500,500i,600,600i&amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            padding: 12px 16px;
            z-index: 1;
            font-size: 18px;
        }
        .dropdown a {
            -webkit-transition: padding .05s linear;
        	-moz-transition: padding .05s linear;
        	-ms-transition: padding .05s linear;
        	-o-transition: padding .05s linear;
        	transition: padding .05s linear;
                    line-height: 30px;
        	padding: 0 20px;
        	height: 80px;
        	color: #777;
        	-webkit-transition: all .1s ease-out;
        	-moz-transition: all .1s ease-out;
        	-ms-transition: all .1s ease-out;
        	-o-transition: all .1s ease-out;
        	transition: all .1s ease-out;
        }
        .dropdown a:hover {
            color: orange;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</head>

<body id="dashBody">

<!-- NAV HEADER -->
<header id="dashHeader">
    <nav id="dashNav">
        <div>
            <img id="dashLogo" src="images/logo.png" alt="logo">
        </div>
        <div class="dashHeadRight dropdown" onclick="document.getElementById('hide').style.display = 'block'">
            <span><img class="dashHeadProfImg dashlink" src="images/{$sessionuserimage}"></span>
            <div class="dropdown-content">
            <p><a class="dashLink" href="wall.php?username={$username}">Wall</a></p>
            <p><a class="dashLink" href="editProfile.php" target="_blank">Edit Profile</a></p>
            <p><a class="dashLink" href="logout.php">LOGOUT</a></p>
            </div>
            <a class="dashLink">{$firstname} {$lastname}</a><br/>    
        </div>
    </nav>
</header>
<!-- end nav header -->

<!-- MAIN CONTAINER -->
<main id="dashMainContainer">

<!-- LEFT DIV -->
<div class="dashLeft">
    {include file='poll.html'}
</div>
<!-- end left div-->
 

<!-- CENTER DIV -->
<div class="dashCenter">
    <!-- opened section for sending posts -->
    <section class='sendPost'>
    <div>
        <img class="dashProfImg" src="images/{$sessionuserimage}">
    </div>
    <div>
        <form action="dashboard.php" enctype="multipart/form-data"  method="post"><br/>
            <input class="inputField" type='text' name='postbody' placeholder="What's on your mind?"><br/>
            <input class="image" value="noImage" type="file" name="image" />
            <select name="privacy" id="privacy">
                <option value="public">&#x1f30d; Public</option>
                <option value="private">&#x1f512; Private</option>
            </select>
            <input class="postSubmit" type='submit' name='submitpost' value='Post'>
        </form>
    </div>
    </section>
    <!-- closed posting -->


    <!-- posts display open-->
    <section class="dashContainer"> 
        {$postsuccessmessage}
    <!-- POST LISTING -->
    {section name=i loop=$postrows}
    <section class="dashPosts"> 
        <!-- individual posts open-->
        <div>
            <img id="postuserimage-{$postrows[i].postid}" class="dashProfImg" src="images/{$postrows[i].userimage}">
        </div>
        <div>
            <a class="dashLink" href="wall.php?username={$postrows[i].username}">
                <span id="postfirstname-{$postrows[i].postid}">{$postrows[i].firstname}</span>
                <span id="postlastname-{$postrows[i].postid}">{$postrows[i].lastname}</span>
            </a><br/>
                <p id="posttext-{$postrows[i].postid}">{$postrows[i].postbody}</p><br/>


            <!-- display if uploaded post image -->
            {if {$postrows[i].image}!==""}
            <div>
                <img src="images/{$postrows[i].image}" onclick="openedit({$postrows[i].postid})" class="postImg" id="myImg-{$postrows[i].postid}"/>
            </div>
            {/if}
            <!-- end of display if uploaded post image -->

            
                <p>{$postrows[i].postdate}</p> <!-- display date -->

            <!-- BUTTONS -->
            <section class="delEdit">
                <!--like button-->
                <button class="dashLike dlike">
                    <i class="fas fa-bolt"></i>
                </button>
                <!--end of like button-->

                <!--display comments button-->
                <button class="dashLike dcomm" onclick="prikazi({$postrows[i].postid})" >
                    <i class="far fa-comment"></i>
                </button>
                <!--end of display comments button-->

                <!-- DELETE AND EDIT BUTTONS -->
                {if {$userid}=={$postrows[i].userid}}
                    <!--delete button-->                
                    <button class="dashLike" onclick="document.getElementById('show{$postrows[i].postid}').style.display = 'block'">
                        <i class="fas fa-trash" title="Delete post"></i>
                    </button>
                        <div class="popup" style="display: none;" id="show{$postrows[i].postid}"><!--PROVERITI da li je postid ili id ili userid-->
                        <div class="popuptext">
                            <p>Are you sure you want to delete this post?</p>
                            <div class="yesno">
                                <div>
                                    <form action="deletePostDash.php?username={$username}&postid={$postrows[i].postid}" method="post">
                                        <button>YES</button>
                                    </form>
                                </div>
                                <div>
                                    <button onclick="document.getElementById('show{$postrows[i].postid}').style.display = 'none'">NO</button>
                                </div>
                            </div>
                        </div> 
                        </div> 
                    <!--end of delete button--> 

                    <!-- edit button -->
                    <div id="editPosts">
                    <div id="page">
                        <button onclick="prepareEdit(this)" class="dashLike" name="editPost" id="{$postrows[i].postid}" id="abc" value="{$postrows[i].postbody}">
                            <i class='fas fa-edit' title='Edit post'></i>
                        </button>
                        <div id="popup"> 
                            <span onclick="document.getElementById('popup').style.display='none'; location.reload();" class="closeedit" title="Close Modal">&times;</span> <br/>
                            <iframe id="iframe"></iframe>
                        </div>
                    </div>
                    </div>
                    <!-- end of edit button -->
                <!-- end of delete and edit buttons -->
                {/if}
            </section>
                
            <!-- end of buttons -->
            <!-- end of individual posts-->


            <!-- COMMENT LISTING -->
            <div style="display: none" class="showComm" id="komentar-{$postrows[i].postid}">
            {section name=j loop=$postrows}
            {if {$postrows[i].postid}=={$commentrows[j].postid}}            
            <span><img id="postuserimage-{$commentrows[j].commentid}" class="commProfImg" src="images/{$commentrows[j].userimage}"></span>
                <a class="dashLink" href="wall.php?username={$commentrows[j].username}">
                    <span id="postfirstname-{$commentrows[j].postid}">{$commentrows[j].firstname}</span>
                    <span id="postlastname-{$commentrows[j].postid}">{$commentrows[j].lastname}</span>
                </a><br/>
                <p id="posttext-{$commentrows[j].commentid}">{$commentrows[j].commentbody}</p><br/>
                <p>{$commentrows[j].commentdate}</p><br/>            
            {/if}
            {/section}
            </div>
            <!-- end comment listing -->


        </div>


        </section><!-- individual posts closed-->
        {/section}


        </section><!-- posts display closed-->  
</div>
<!-- END OF CENTER DIV -->

<!-- RIGHT DIV -->
<div class="dashRight">
    <div class="desno">
        <h3>List of active users</h3>
        {section name=i loop=$usersrows}
            <img class="commProfImg" src="images/{$usersrows[i].userimage}" />
            <a style="padding-left: 10px" class="dashLink" href="wall.php?username={$usersrows[i].username}">
                <span class="textRight" id="userfirstname-{$usersrows[i].firstname}">{$usersrows[i].firstname}</span>
                <span class="textRight" id="userlastname-{$usersrows[i].lastname}">{$usersrows[i].lastname}</span><br>
            </a>
        {/section}
    </div> 
</div>
<!-- end of right div -->
    
<!-- THE MODAL -->
<div id="myModal" class="modal">
    <span class="close">&times;</span>
    <div class="containerComm" style="color: white">
    <div class="contImg">
        <img class="modal-content" id="img01">
    </div>


    <div class="commentar">
    <!-- individual post open--> 
    <section class="dashPosts" > 
        <div><img id="postuserimage" class="dashProfImg" src="images/{$postrows[i].userimage}"></div>
        <div>
            <a class="dashLink" href="wall.php?username={$postrows[i].username}">
                <span id="postfirstname" style="color: black"></span>
                <span id="postlastname" style="color: black"></span>
            </a><br/>
                <p id="posttext" style="color: black"></p><br/>
            <p>{$postrows[i].postdate}</p>
        <button class="dashLike dlike"><i class="fas fa-bolt"></i></button>
        <button class="dashLike dcomm"><i class="far fa-comment"></i></button>
        </div>
    </section>
    <!-- end of individual post-->
          
    <!-- post a new comment -->    
    <div class='sendPost'>
    <div class="item1"> <!-- dashboard profile image-->
       <img id="postuserimage" class="dashProfImg" src="images/{$sessionuserimage}"></div>
       <form action="dashboard.php" enctype="multipart/form-data" method="post">
            <div class="item2">
                <input type="hidden" name='postid' id="postIdHold">
                <input class="inputField" type='text' name='commentbody' placeholder="Enter your comment...">
            </div>
            <div class="item3">
               <input class="postSubmit" type='submit' name='submitComment' value='Post'>
            </div>
        </form>
    </div>
    <!-- end of post a new comment -->

    <!-- comment listing -->
    <section class="dashPosts skroler" id="commentSection">
        <div>
            <img id="postuserimageInComm" class="commProfImg" src="images/{$commentrows[i].userimage}">
        </div>        
        <a class="dashLink" href="wall.php?username={$commentrows[i].username}">
            <span id="postfirstnameInComm" style="color: black" ></span>
            <span id="postlastnameInComm" style="color: black"></span>
        </a><br/>
        <p id="postbodyInComm" style="color: black"></p><br/>
        <p>{$commentrows[i].commentdate}</p>
        <div></div>
        <div></div>
           
    </section>
    <!-- end of comment listing-->

    <!-- individual post closed-->   
    </div>
    </div>
</div>


</main>

<script>
   if ( window.history.replaceState ) {
       window.history.replaceState( null, null, window.location.href );
   }

    // Get the modal
    var modal = document.getElementById('myModal');


    function openedit(postid){
       
        var img = document.getElementById('myImg-'+postid);
        var modalImg = document.getElementById("img01");
        var modalPosttext = document.getElementById('posttext');
        var dashboardPostText = document.getElementById('posttext-'+postid);
        var modaluserimage = document.getElementById('postuserimage');
        var dashboarduserimage = document.getElementById('postuserimage-'+postid);
        var dashboardfirstname = document.getElementById('postfirstname-'+postid);
        var modalfirstname = document.getElementById('postfirstname');
        var dashboardlastname = document.getElementById('postlastname-'+postid);
        var modallastname = document.getElementById('postlastname');
        
        document.getElementById("postIdHold").value=postid;
        modal.style.display = "block";
        modalImg.src = img.src;
        modalPosttext.innerHTML = dashboardPostText.innerHTML;
        modaluserimage.src = dashboarduserimage.src;
        modalfirstname.innerHTML = dashboardfirstname.innerHTML;
        modallastname.innerHTML = dashboardlastname.innerHTML;
        
        var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          var list = this.responseText;
            var lista=JSON.parse(list);
            console.log(lista);
            listComments(lista);
        }
      };
      xhttp.open("POST", "showComment.php", true);
      xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xhttp.send("postid="+postid);
    }
    function listComments(niz){
        
        var el= document.getElementById("commentSection");
        el.innerHTML='';
        for(var i in niz){
            
            el.innerHTML+='<div class="stilCommImg"><img id="postuserimageInComm" class="commProfImg" src="images/'+niz[i].userimage+'"></div><div class="stilCommBody"><a class="dashLink" href="wall.php?username='+niz[i].userid+'"><span id="postfirstnameInComm" style="color: black" >'+niz[i].firstname+' '+'</span><span id="postlastnameInComm" style="color: black">'+niz[i].lastname+'</span></a><br/><p id="postbodyInComm" style="color: black">'+niz[i].commentbody+'</p></br><p>'+niz[i].commentdate+'</p><div style="display:block"><div style="height: 5px; overflow: hidden; width: 100%;"></div><hr style="width:100%;"><div style="height: 5px; overflow: hidden; width: 100%;"></div></div></div>'
        }
        

        
    }

    var span = document.getElementsByClassName("close")[0];

    span.onclick = function() { 
      modal.style.display = "none";
    }
</script>
<script>

    function prikazi(id){
        var elem=document.getElementById('komentar-'+id);
        if(elem.style.display=="block"){
        elem.style.display="none";
        }else{
            elem.style.display="block";
        }
    }
</script>
<script type="text/javascript" src="skript.js"></script>
</body>
</html>
