
function pncheck(){
    const exp= /^\d{3}-\d{4}-\d{4}$/;
    const phone = document.getElementById('pn').value;
    const result = document.getElementById('phone-check-result');

    if(phone.match(exp)){
        result.innerHTML ="GOOD"
        result.style.color="green";
    }
    else if(phone.length==0){
       result.innerHTML="필수 입력값입니다.";
       result.style.color="red";
    }
    else{
        result.innerHTML="유효하지 않은 형식입니다"
        result.style.color="red"
    }

}

function pw1check(){
    pw1ch=document.getElementById("pw1").value;
    pw1out=document.getElementById("pw1output");
    pwlength=pw1ch.length;

  
    const exp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,16}$/;

    if(pwlength==0){
        pw1out.innerHTML="필수 입력값입니다.";
        pw1out.style.color="red";
    }
    else if (pw1ch.match(exp)){
        pw1out.innerHTML="GOOD";
        pw1out.style.color="green"
    }
    else{
        pw1out.innerHTML="8~16자 영문 대 소문자, 숫자로 입력하세요";
        pw1out.style.color="red";
    }

}

function pw2check(){
    pw1ch=document.getElementById("pw1").value;
    pw2ch=document.getElementById("pw2").value;
    pw2out=document.getElementById("pw2output");            

    if(pw1ch==pw2ch){
        pw2out.innerHTML="GOOD";
        pw2out.style.color="green";
    }

    else{
        pw2out.innerHTML="비밀번호가 일치하지않습니다.";
        pw2out.style.color="red";
    }


}






function namecheck(){
    const name=document.getElementById('name').value;
    const ch=document.getElementById('nameoutput');
    if(name.length==0){
        ch.innerHTML="필수 입력값입니다.";
        ch.style.color="red";
    }
    else{
        ch.innerHTML="GOOD";
        ch.style.color="green";
    
    }
}
