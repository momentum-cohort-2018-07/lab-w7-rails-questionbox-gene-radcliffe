
   $(document).on('turbolinks:load', function() {
    $('#sub_form_question').submit(function(e){
        e.preventDefault();
        
        var tok = $('#token').val() 
       // var hash = window.btoa(tok);
        var ret = "Bearer " + tok;
        
        var title = $('#title').val();
        var body = $('#body').val();
        var userid = $('#userid').val();
        var publish_date = $('#publishdate').val()   
            $.ajax({
                type: "POST",
                url: "http://localhost:3007/api/v1/users/"+ userid + "/questions",
                dataType: 'json',
                data:   {question: {title: title,
                                body: body,
                                publish_date: publish_date}},
                beforeSend: function (xhr){ 
                    xhr.setRequestHeader('Authorization', ret); 
                },
                success: function (data, status, jqxhr){
                        if(data.status == "ok"){
                            window.location.replace("http://localhost:3000/welcome/index") 
                        }
                  
                }
    
            })
        
        })
      $('#sub_form').submit(function(e){
        e.preventDefault()
        
            var tok = $('#username').val() + ':' + $('#password').val();
            var hash = window.btoa(tok);
            var ret = "Basic " + hash;
          
        
        $.ajax({
            type: "GET",
            url: "http://localhost:3007/api/v1/users/login",
            dataType: 'json',
            beforeSend: function (xhr){ 
                xhr.setRequestHeader('Authorization', ret); 
            },
            success: function (data, status, jqxhr){
               if (data.status = "ok"){
                createSession(data.token,data.username,data.id,data.joined)  
               }else{
                   alert("wrong username / password")
               }
              
            },
            complete: function(jqXHR, status){
                jqXHR.done(function(data, jqXHR, status){
                   
                                             
                 
                  

                })
            }

        });

    })
    $('#sub_form_signup').submit(function(e){
        e.preventDefault()
         var username = $('#username').val();
         var password = $('#password').val();
         var email = $('#email').val();

        $.ajax({
            type: "POST",
            url: "http://localhost:3007/api/v1/users",
            dataType: 'json',
            data:   {user: {username: username,
                            email: email,
                            password: password}},
            beforeSend: function(){
                //validate form first
            },
            success: function (data, status, jqxhr){
                //redirect to createSession
               //createSession(data.token)
                
                console.log("username: " + data.username)
               if (data.status == "bad_request"){
                var errors = data.message
                    displayWarning(errors)
                        
               } 
               if (data.status == "ok"){
                
                    createSession(data.token, data.username, data.id, data.joined)
                    console.log(data.token)
               }
               
              
            }
        });

    });
    function displayWarning(errors){
       
        var warningDiv = document.createElement("div")
        var warningDivMessage = document.createElement("h2")
        warningDivMessage.innerText = "Please Correct the following"
        warningDiv.appendChild(warningDivMessage)
        
        var warningList = document.createElement("ul")
        warningList.classList.add("error-list", "list-group","list-group-flush")
        for(x in errors){
            var listItem = document.createElement("li");
            listItem.classList.add("list-group-item", "list-group-item-warning")
            listItem.innerText = x + " " + errors[x];
            warningList.appendChild(listItem)     
                   
        }
        warningDiv.appendChild(warningList)
        warningDiv.classList.add("alert", "alert-danger")
        var signuperror = document.getElementById('signup-error')
        signuperror.appendChild(warningDiv)
        signuperror.classList.remove("d-none")
        signuperror.classList.add("d-block")
    }
    
    function invalidFields(field){
        
       if (!isInputValid(field)){
            var control = document.getElementById(field)
            control.classList.add("is-invalid")
       }
    }
    function createSession(token, username, userid, joined){
        $.ajax({
            type: "POST",
            url: "http://localhost:3000/sessions/create?token=" + token +"&username=" + username + "&userid=" +userid + "&joined=" + joined,
            dataType: 'json',
            complete: function (jqXHR, status){
                window.location.replace("http://localhost:3000/welcome/index")
            }     
        })
    }
   })

   