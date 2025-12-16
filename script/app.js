const dirction= [...document.querySelectorAll('.dierction')]
const mal=document.querySelector("#carouselle")
const list_img=[]
const btn_block=[...document.querySelectorAll("#add")]

dirction.forEach(Element=>{
    Element.addEventListener("click",()=>{
        if (Element.classList.contains("left")){
            console.log("gauche");
            
        }
    })
})

btn_block.forEach(el=>{
    el.addEventListener('click',()=>{
        alert(btn_block.indexOf(el))
    })
})