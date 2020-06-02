var frm = $('#uploadform');
var frmaction = frm.attr('action')
var lkcount = 0
frm.submit(function (e) {
    e.preventDefault();
    var lkFD = $("#lks").val()
    
	if (!/([^\s])/.test(lkFD)) { alert("Please Enter Url"); return false }
	
	var nmFD = $("#nms").val();
	var links = lkFD.split(/[ ,\n]+/).filter(Boolean);
    var names = nmFD.split(/[\n]+/).filter(Boolean);
            //    res.innerHTML += ' <br> ';
                for (let i = 0; i <links.length ; i++) {
                let url = links[i];
				let filename = names[i] || ""
                //    res.innerHTML += ` <br> ${filename} = ${url} `
           	     send(url,filename)
        //   show(url,filename)
		}
		
    return false;
});

function show(url,filename){
	res.innerHTML += ` <br> ${filename} = ${url} `
	}
    function send(url,filename){
    var dataString = 'url=' + encodeURIComponent(url) + '&filename=' + encodeURIComponent(filename);   
        $.ajax({
            type: 'POST',
            url: frmaction,
            data: dataString,
            cache: false,
            success: function () {  
           lkcount++
                $("#submit_message").remove();
                frm.html('<p id="submit_message" style="font-size: large; color: green">  <i class="fa fa-check" aria-hidden="true"></i> Successfully Submitted '+lkcount+' link(s) </p>')
            },
            error: function (data) {
                $("#submit_message2").remove();
                console.log(data.responseText);
                var json = $.parseJSON(data.responseText);
                var message = json["message"];

                if (json["statusCode"] / 100 == 5)
                    message = (message == null) ? "Send Failed" : message;

                frm.append('<p id="submit_message2" style="font-size: large; color: red"> <a href = '+url+' >link</a> Error: ' + message + '</p>')
                console.log(json);
            }
        });
    }
function getcount($this,islkfd) {
            setTimeout(function () {
                $this.nextElementSibling.innerText = getcheck($this.value,islkfd)
            }, 10)
        }
function getcheck($this,islkfd) {
            var string = $this;
            if(islkfd){  
            var urllinks = string.split(/[ ,\n]+/).filter(Boolean);
            }else{
            var urllinks = string.split(/[\n]+/).filter(Boolean);
			}
            if (urllinks.length === 0) { return "" }
             return urllinks.length            
        }

function check($this) {
      var urls = document.querySelector("#checkurls");
      
   if ($this.value === "Check") {
   	var lkFD = $("#lks").val()
		if (!/([^\s])/.test(lkFD)) { return false }
		
		// urls.innerHTML = lkFD
        $this.value = "Uncheck"
        
		var nmFD = $("#nms").val();
		var links = lkFD.split(/[ ,\n]+/).filter(Boolean);
        var names = nmFD.split(/[\n]+/).filter(Boolean);
        var noname=""
        if (names.length!==0){
            nmText = '| '+ names.length + ' names(s) '
            noname = "undefined"
          }else
            nmText = ''; 
     
		urls.innerHTML = `<div style="border-bottom:1px solid black" > <b> Total ${links.length} link(s) ${nmText}</b></div> `
        for (let i = 0; i < links.length; i++) {        	
        let fileurl = links[i];
		let filename = names[i] || noname
         urls.innerHTML += `<b> ${i+1}</b>) <b>${filename}</b> ${fileurl} <BR>`;
	  } // forloop
        
      } else {
        $this.value = "Check"
        urls.innerText = "";
      }
    }

