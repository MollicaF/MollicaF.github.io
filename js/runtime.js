// -- Access the kinship svg --
//This gets the document, not the markup elements
var abi_document = document.getElementById("abi");
var abi_svg;  //this will hold the markup
var abi_elements;  //this will hold an array of the individuals to iterate through
var abi_epoch = "";

//once the file has loaded, we can access the internal elements
abi_document.addEventListener("load",function(){
    abi_svg = abi_document.contentDocument;  //get inner content (markup)
    abi_elements = abi_svg.getElementsByClassName("people"); //get the people
    abi_epoch = abi_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var abi_slider = document.getElementById("abi_slider");

abi_slider.oninput = function() {
    abi_epoch.textContent = "N:" + abi_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<abi_elements.length; i++){
        abi_elements[i].style.fill = abi[abi_elements[i].id][+abi_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var abla_document = document.getElementById("abla");
var abla_svg;  //this will hold the markup
var abla_elements;  //this will hold an array of the individuals to iterate through
var abla_epoch = "";

//once the file has loaded, we can access the internal elements
abla_document.addEventListener("load",function(){
    abla_svg = abla_document.contentDocument;  //get inner content (markup)
    abla_elements = abla_svg.getElementsByClassName("people"); //get the people
    abla_epoch = abla_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var abla_slider = document.getElementById("abla_slider");

abla_slider.oninput = function() {
    abla_epoch.textContent = "N:" + abla_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<abla_elements.length; i++){
        abla_elements[i].style.fill = abla[abla_elements[i].id][+abla_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var amca_document = document.getElementById("amca");
var amca_svg;  //this will hold the markup
var amca_elements;  //this will hold an array of the individuals to iterate through
var amca_epoch = "";

//once the file has loaded, we can access the internal elements
amca_document.addEventListener("load",function(){
    amca_svg = amca_document.contentDocument;  //get inner content (markup)
    amca_elements = amca_svg.getElementsByClassName("people"); //get the people
    amca_epoch = amca_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var amca_slider = document.getElementById("amca_slider");

amca_slider.oninput = function() {
    amca_epoch.textContent = "N:" + amca_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<amca_elements.length; i++){
        amca_elements[i].style.fill = amca[amca_elements[i].id][+amca_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var anneanne_document = document.getElementById("anneanne");
var anneanne_svg;  //this will hold the markup
var anneanne_elements;  //this will hold an array of the individuals to iterate through
var anneanne_epoch = "";

//once the file has loaded, we can access the internal elements
anneanne_document.addEventListener("load",function(){
    anneanne_svg = anneanne_document.contentDocument;  //get inner content (markup)
    anneanne_elements = anneanne_svg.getElementsByClassName("people"); //get the people
    anneanne_epoch = anneanne_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var anneanne_slider = document.getElementById("anneanne_slider");

anneanne_slider.oninput = function() {
    anneanne_epoch.textContent = "N:" + anneanne_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<anneanne_elements.length; i++){
        anneanne_elements[i].style.fill = anneanne[anneanne_elements[i].id][+anneanne_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var anne_document = document.getElementById("anne");
var anne_svg;  //this will hold the markup
var anne_elements;  //this will hold an array of the individuals to iterate through
var anne_epoch = "";

//once the file has loaded, we can access the internal elements
anne_document.addEventListener("load",function(){
    anne_svg = anne_document.contentDocument;  //get inner content (markup)
    anne_elements = anne_svg.getElementsByClassName("people"); //get the people
    anne_epoch = anne_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var anne_slider = document.getElementById("anne_slider");

anne_slider.oninput = function() {
    anne_epoch.textContent = "N:" + anne_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<anne_elements.length; i++){
        anne_elements[i].style.fill = anne[anne_elements[i].id][+anne_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var aunt_document = document.getElementById("aunt");
var aunt_svg;  //this will hold the markup
var aunt_elements;  //this will hold an array of the individuals to iterate through
var aunt_epoch = "";

//once the file has loaded, we can access the internal elements
aunt_document.addEventListener("load",function(){
    aunt_svg = aunt_document.contentDocument;  //get inner content (markup)
    aunt_elements = aunt_svg.getElementsByClassName("people"); //get the people
    aunt_epoch = aunt_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var aunt_slider = document.getElementById("aunt_slider");

aunt_slider.oninput = function() {
    aunt_epoch.textContent = "N:" + aunt_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<aunt_elements.length; i++){
        aunt_elements[i].style.fill = aunt[aunt_elements[i].id][+aunt_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var babaanne_document = document.getElementById("babaanne");
var babaanne_svg;  //this will hold the markup
var babaanne_elements;  //this will hold an array of the individuals to iterate through
var babaanne_epoch = "";

//once the file has loaded, we can access the internal elements
babaanne_document.addEventListener("load",function(){
    babaanne_svg = babaanne_document.contentDocument;  //get inner content (markup)
    babaanne_elements = babaanne_svg.getElementsByClassName("people"); //get the people
    babaanne_epoch = babaanne_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var babaanne_slider = document.getElementById("babaanne_slider");

babaanne_slider.oninput = function() {
    babaanne_epoch.textContent = "N:" + babaanne_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<babaanne_elements.length; i++){
        babaanne_elements[i].style.fill = babaanne[babaanne_elements[i].id][+babaanne_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var baba_document = document.getElementById("baba");
var baba_svg;  //this will hold the markup
var baba_elements;  //this will hold an array of the individuals to iterate through
var baba_epoch = "";

//once the file has loaded, we can access the internal elements
baba_document.addEventListener("load",function(){
    baba_svg = baba_document.contentDocument;  //get inner content (markup)
    baba_elements = baba_svg.getElementsByClassName("people"); //get the people
    baba_epoch = baba_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var baba_slider = document.getElementById("baba_slider");

baba_slider.oninput = function() {
    baba_epoch.textContent = "N:" + baba_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<baba_elements.length; i++){
        baba_elements[i].style.fill = baba[baba_elements[i].id][+baba_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var brother_document = document.getElementById("brother");
var brother_svg;  //this will hold the markup
var brother_elements;  //this will hold an array of the individuals to iterate through
var brother_epoch = "";

//once the file has loaded, we can access the internal elements
brother_document.addEventListener("load",function(){
    brother_svg = brother_document.contentDocument;  //get inner content (markup)
    brother_elements = brother_svg.getElementsByClassName("people"); //get the people
    brother_epoch = brother_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var brother_slider = document.getElementById("brother_slider");

brother_slider.oninput = function() {
    brother_epoch.textContent = "N:" + brother_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<brother_elements.length; i++){
        brother_elements[i].style.fill = brother[brother_elements[i].id][+brother_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var cousin_document = document.getElementById("cousin");
var cousin_svg;  //this will hold the markup
var cousin_elements;  //this will hold an array of the individuals to iterate through
var cousin_epoch = "";

//once the file has loaded, we can access the internal elements
cousin_document.addEventListener("load",function(){
    cousin_svg = cousin_document.contentDocument;  //get inner content (markup)
    cousin_elements = cousin_svg.getElementsByClassName("people"); //get the people
    cousin_epoch = cousin_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var cousin_slider = document.getElementById("cousin_slider");

cousin_slider.oninput = function() {
    cousin_epoch.textContent = "N:" + cousin_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<cousin_elements.length; i++){
        cousin_elements[i].style.fill = cousin[cousin_elements[i].id][+cousin_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var dayi_document = document.getElementById("dayi");
var dayi_svg;  //this will hold the markup
var dayi_elements;  //this will hold an array of the individuals to iterate through
var dayi_epoch = "";

//once the file has loaded, we can access the internal elements
dayi_document.addEventListener("load",function(){
    dayi_svg = dayi_document.contentDocument;  //get inner content (markup)
    dayi_elements = dayi_svg.getElementsByClassName("people"); //get the people
    dayi_epoch = dayi_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var dayi_slider = document.getElementById("dayi_slider");

dayi_slider.oninput = function() {
    dayi_epoch.textContent = "N:" + dayi_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<dayi_elements.length; i++){
        dayi_elements[i].style.fill = dayi[dayi_elements[i].id][+dayi_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var dede_document = document.getElementById("dede");
var dede_svg;  //this will hold the markup
var dede_elements;  //this will hold an array of the individuals to iterate through
var dede_epoch = "";

//once the file has loaded, we can access the internal elements
dede_document.addEventListener("load",function(){
    dede_svg = dede_document.contentDocument;  //get inner content (markup)
    dede_elements = dede_svg.getElementsByClassName("people"); //get the people
    dede_epoch = dede_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var dede_slider = document.getElementById("dede_slider");

dede_slider.oninput = function() {
    dede_epoch.textContent = "N:" + dede_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<dede_elements.length; i++){
        dede_elements[i].style.fill = dede[dede_elements[i].id][+dede_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var eniste_document = document.getElementById("eniste");
var eniste_svg;  //this will hold the markup
var eniste_elements;  //this will hold an array of the individuals to iterate through
var eniste_epoch = "";

//once the file has loaded, we can access the internal elements
eniste_document.addEventListener("load",function(){
    eniste_svg = eniste_document.contentDocument;  //get inner content (markup)
    eniste_elements = eniste_svg.getElementsByClassName("people"); //get the people
    eniste_epoch = eniste_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var eniste_slider = document.getElementById("eniste_slider");

eniste_slider.oninput = function() {
    eniste_epoch.textContent = "N:" + eniste_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<eniste_elements.length; i++){
        eniste_elements[i].style.fill = eniste[eniste_elements[i].id][+eniste_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var father_document = document.getElementById("father");
var father_svg;  //this will hold the markup
var father_elements;  //this will hold an array of the individuals to iterate through
var father_epoch = "";

//once the file has loaded, we can access the internal elements
father_document.addEventListener("load",function(){
    father_svg = father_document.contentDocument;  //get inner content (markup)
    father_elements = father_svg.getElementsByClassName("people"); //get the people
    father_epoch = father_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var father_slider = document.getElementById("father_slider");

father_slider.oninput = function() {
    father_epoch.textContent = "N:" + father_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<father_elements.length; i++){
        father_elements[i].style.fill = father[father_elements[i].id][+father_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var grandma_document = document.getElementById("grandma");
var grandma_svg;  //this will hold the markup
var grandma_elements;  //this will hold an array of the individuals to iterate through
var grandma_epoch = "";

//once the file has loaded, we can access the internal elements
grandma_document.addEventListener("load",function(){
    grandma_svg = grandma_document.contentDocument;  //get inner content (markup)
    grandma_elements = grandma_svg.getElementsByClassName("people"); //get the people
    grandma_epoch = grandma_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var grandma_slider = document.getElementById("grandma_slider");

grandma_slider.oninput = function() {
    grandma_epoch.textContent = "N:" + grandma_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<grandma_elements.length; i++){
        grandma_elements[i].style.fill = grandma[grandma_elements[i].id][+grandma_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var grandpa_document = document.getElementById("grandpa");
var grandpa_svg;  //this will hold the markup
var grandpa_elements;  //this will hold an array of the individuals to iterate through
var grandpa_epoch = "";

//once the file has loaded, we can access the internal elements
grandpa_document.addEventListener("load",function(){
    grandpa_svg = grandpa_document.contentDocument;  //get inner content (markup)
    grandpa_elements = grandpa_svg.getElementsByClassName("people"); //get the people
    grandpa_epoch = grandpa_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var grandpa_slider = document.getElementById("grandpa_slider");

grandpa_slider.oninput = function() {
    grandpa_epoch.textContent = "N:" + grandpa_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<grandpa_elements.length; i++){
        grandpa_elements[i].style.fill = grandpa[grandpa_elements[i].id][+grandpa_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var hala_document = document.getElementById("hala");
var hala_svg;  //this will hold the markup
var hala_elements;  //this will hold an array of the individuals to iterate through
var hala_epoch = "";

//once the file has loaded, we can access the internal elements
hala_document.addEventListener("load",function(){
    hala_svg = hala_document.contentDocument;  //get inner content (markup)
    hala_elements = hala_svg.getElementsByClassName("people"); //get the people
    hala_epoch = hala_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var hala_slider = document.getElementById("hala_slider");

hala_slider.oninput = function() {
    hala_epoch.textContent = "N:" + hala_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<hala_elements.length; i++){
        hala_elements[i].style.fill = hala[hala_elements[i].id][+hala_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var kainga_document = document.getElementById("kainga");
var kainga_svg;  //this will hold the markup
var kainga_elements;  //this will hold an array of the individuals to iterate through
var kainga_epoch = "";

//once the file has loaded, we can access the internal elements
kainga_document.addEventListener("load",function(){
    kainga_svg = kainga_document.contentDocument;  //get inner content (markup)
    kainga_elements = kainga_svg.getElementsByClassName("people"); //get the people
    kainga_epoch = kainga_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var kainga_slider = document.getElementById("kainga_slider");

kainga_slider.oninput = function() {
    kainga_epoch.textContent = "N:" + kainga_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<kainga_elements.length; i++){
        kainga_elements[i].style.fill = kainga[kainga_elements[i].id][+kainga_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var kuzen_document = document.getElementById("kuzen");
var kuzen_svg;  //this will hold the markup
var kuzen_elements;  //this will hold an array of the individuals to iterate through
var kuzen_epoch = "";

//once the file has loaded, we can access the internal elements
kuzen_document.addEventListener("load",function(){
    kuzen_svg = kuzen_document.contentDocument;  //get inner content (markup)
    kuzen_elements = kuzen_svg.getElementsByClassName("people"); //get the people
    kuzen_epoch = kuzen_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var kuzen_slider = document.getElementById("kuzen_slider");

kuzen_slider.oninput = function() {
    kuzen_epoch.textContent = "N:" + kuzen_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<kuzen_elements.length; i++){
        kuzen_elements[i].style.fill = kuzen[kuzen_elements[i].id][+kuzen_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var matuatane_document = document.getElementById("matuatane");
var matuatane_svg;  //this will hold the markup
var matuatane_elements;  //this will hold an array of the individuals to iterate through
var matuatane_epoch = "";

//once the file has loaded, we can access the internal elements
matuatane_document.addEventListener("load",function(){
    matuatane_svg = matuatane_document.contentDocument;  //get inner content (markup)
    matuatane_elements = matuatane_svg.getElementsByClassName("people"); //get the people
    matuatane_epoch = matuatane_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var matuatane_slider = document.getElementById("matuatane_slider");

matuatane_slider.oninput = function() {
    matuatane_epoch.textContent = "N:" + matuatane_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<matuatane_elements.length; i++){
        matuatane_elements[i].style.fill = matuatane[matuatane_elements[i].id][+matuatane_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var matuawawine_document = document.getElementById("matuawawine");
var matuawawine_svg;  //this will hold the markup
var matuawawine_elements;  //this will hold an array of the individuals to iterate through
var matuawawine_epoch = "";

//once the file has loaded, we can access the internal elements
matuawawine_document.addEventListener("load",function(){
    matuawawine_svg = matuawawine_document.contentDocument;  //get inner content (markup)
    matuawawine_elements = matuawawine_svg.getElementsByClassName("people"); //get the people
    matuawawine_epoch = matuawawine_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var matuawawine_slider = document.getElementById("matuawawine_slider");

matuawawine_slider.oninput = function() {
    matuawawine_epoch.textContent = "N:" + matuawawine_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<matuawawine_elements.length; i++){
        matuawawine_elements[i].style.fill = matuawawine[matuawawine_elements[i].id][+matuawawine_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var mother_document = document.getElementById("mother");
var mother_svg;  //this will hold the markup
var mother_elements;  //this will hold an array of the individuals to iterate through
var mother_epoch = "";

//once the file has loaded, we can access the internal elements
mother_document.addEventListener("load",function(){
    mother_svg = mother_document.contentDocument;  //get inner content (markup)
    mother_elements = mother_svg.getElementsByClassName("people"); //get the people
    mother_epoch = mother_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var mother_slider = document.getElementById("mother_slider");

mother_slider.oninput = function() {
    mother_epoch.textContent = "N:" + mother_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<mother_elements.length; i++){
        mother_elements[i].style.fill = mother[mother_elements[i].id][+mother_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var sister_document = document.getElementById("sister");
var sister_svg;  //this will hold the markup
var sister_elements;  //this will hold an array of the individuals to iterate through
var sister_epoch = "";

//once the file has loaded, we can access the internal elements
sister_document.addEventListener("load",function(){
    sister_svg = sister_document.contentDocument;  //get inner content (markup)
    sister_elements = sister_svg.getElementsByClassName("people"); //get the people
    sister_epoch = sister_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var sister_slider = document.getElementById("sister_slider");

sister_slider.oninput = function() {
    sister_epoch.textContent = "N:" + sister_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<sister_elements.length; i++){
        sister_elements[i].style.fill = sister[sister_elements[i].id][+sister_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var taina_document = document.getElementById("taina");
var taina_svg;  //this will hold the markup
var taina_elements;  //this will hold an array of the individuals to iterate through
var taina_epoch = "";

//once the file has loaded, we can access the internal elements
taina_document.addEventListener("load",function(){
    taina_svg = taina_document.contentDocument;  //get inner content (markup)
    taina_elements = taina_svg.getElementsByClassName("people"); //get the people
    taina_epoch = taina_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var taina_slider = document.getElementById("taina_slider");

taina_slider.oninput = function() {
    taina_epoch.textContent = "N:" + taina_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<taina_elements.length; i++){
        taina_elements[i].style.fill = taina[taina_elements[i].id][+taina_slider.value];
    }
}
// -- Access the kinship svg --
//This gets the document, not the markup elements
var teyze_document = document.getElementById("teyze");
var teyze_svg;  //this will hold the markup
var teyze_elements;  //this will hold an array of the individuals to iterate through
var teyze_epoch = "";

//once the file has loaded, we can access the internal elements
teyze_document.addEventListener("load",function(){
    teyze_svg = teyze_document.contentDocument;  //get inner content (markup)
    teyze_elements = teyze_svg.getElementsByClassName("people"); //get the people
    teyze_epoch = teyze_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var teyze_slider = document.getElementById("teyze_slider");

teyze_slider.oninput = function() {
    teyze_epoch.textContent = "N:" + teyze_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<teyze_elements.length; i++){
        teyze_elements[i].style.fill = teyze[teyze_elements[i].id][+teyze_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var tupunatane_document = document.getElementById("tupunatane");
var tupunatane_svg;  //this will hold the markup
var tupunatane_elements;  //this will hold an array of the individuals to iterate through
var tupunatane_epoch = "";

//once the file has loaded, we can access the internal elements
tupunatane_document.addEventListener("load",function(){
    tupunatane_svg = tupunatane_document.contentDocument;  //get inner content (markup)
    tupunatane_elements = tupunatane_svg.getElementsByClassName("people"); //get the people
    tupunatane_epoch = tupunatane_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var tupunatane_slider = document.getElementById("tupunatane_slider");

tupunatane_slider.oninput = function() {
    tupunatane_epoch.textContent = "N:" + tupunatane_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<tupunatane_elements.length; i++){
        tupunatane_elements[i].style.fill = tupunatane[tupunatane_elements[i].id][+tupunatane_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var tupunawawine_document = document.getElementById("tupunawawine");
var tupunawawine_svg;  //this will hold the markup
var tupunawawine_elements;  //this will hold an array of the individuals to iterate through
var tupunawawine_epoch = "";

//once the file has loaded, we can access the internal elements
tupunawawine_document.addEventListener("load",function(){
    tupunawawine_svg = tupunawawine_document.contentDocument;  //get inner content (markup)
    tupunawawine_elements = tupunawawine_svg.getElementsByClassName("people"); //get the people
    tupunawawine_epoch = tupunawawine_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var tupunawawine_slider = document.getElementById("tupunawawine_slider");

tupunawawine_slider.oninput = function() {
    tupunawawine_epoch.textContent = "N:" + tupunawawine_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<tupunawawine_elements.length; i++){
        tupunawawine_elements[i].style.fill = tupunawawine[tupunawawine_elements[i].id][+tupunawawine_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var uncle_document = document.getElementById("uncle");
var uncle_svg;  //this will hold the markup
var uncle_elements;  //this will hold an array of the individuals to iterate through
var uncle_epoch = "";

//once the file has loaded, we can access the internal elements
uncle_document.addEventListener("load",function(){
    uncle_svg = uncle_document.contentDocument;  //get inner content (markup)
    uncle_elements = uncle_svg.getElementsByClassName("people"); //get the people
    uncle_epoch = uncle_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var uncle_slider = document.getElementById("uncle_slider");

uncle_slider.oninput = function() {
    uncle_epoch.textContent = "N:" + uncle_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<uncle_elements.length; i++){
        uncle_elements[i].style.fill = uncle[uncle_elements[i].id][+uncle_slider.value];
    }
}

// -- Access the kinship svg --
//This gets the document, not the markup elements
var yenge_document = document.getElementById("yenge");
var yenge_svg;  //this will hold the markup
var yenge_elements;  //this will hold an array of the individuals to iterate through
var yenge_epoch = "";

//once the file has loaded, we can access the internal elements
yenge_document.addEventListener("load",function(){
    yenge_svg = yenge_document.contentDocument;  //get inner content (markup)
    yenge_elements = yenge_svg.getElementsByClassName("people"); //get the people
    yenge_epoch = yenge_svg.getElementById("epoch"); //get the text element in the svg (I added an ID tag there)
}, false);


var yenge_slider = document.getElementById("yenge_slider");

yenge_slider.oninput = function() {
    yenge_epoch.textContent = "N:" + yenge_slider.value; //set the epoch in the SVG

    //go through all the people and set the fill per person based on the value in the data array:
    //take the id of the current indexed person, and get the epoch data that matches the slider
    for(var i=0; i<yenge_elements.length; i++){
        yenge_elements[i].style.fill = yenge[yenge_elements[i].id][+yenge_slider.value];
    }
}

