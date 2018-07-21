'use strict';
(function wrap() { 

  // jquery style
  function $el(selector) {
    let el = document.querySelector(selector);
    return el;
  }

  function $els(selector) {
    let els = document.querySelectorAll(selector);
    return els;
  }

  let titles = $els('.archive__title');
  
  function changeIcon (x) {
    if(x.contains('fa-minus')) {
      x.remove('fa-minus');
      x.add('fa-plus');
    } else if (x.contains('fa-plus')) {
      x.remove('fa-plus');
      x.add('fa-minus');
    }  
  }

  function toggleArchive(triggers) {
    let parent = ''; // .archive element
    let gran = ''; // .archive element parent 
    let siblings = ''; // hold .archive siblings
    let next = ''; 
    let nList = ''; // list of next sibling element classes 
    let expand = 'archive__expanded';
    let archive = '';
    triggers.forEach((trigger, index) => {
      trigger.addEventListener('click', function() {
        next = this.nextElementSibling;
        // select plus or minus icon

        let icon = this.children[1].children[0];
        let iClass = icon.classList;
        changeIcon(iClass);
        
        nList = next.classList;
        nList.contains(expand) ? nList.remove(expand) : nList.add(expand);
        parent = this.parentNode;
        gran = parent.parentNode;

        siblings = Array.from(gran.children).filter((sibling) => {
          // filter out the clicked archive
          return sibling !== parent;
        });

        siblings.forEach(sibling => {
          let sIcon = sibling.children[0].children[1].children[0];
          let sClass = sIcon.classList;
          sClass.contains('fa-minus') ? changeIcon(sClass) : false;
          archive = sibling.classList;
          let sList = '';

          Array.from(sibling.children).forEach((kid) => {
            sList = kid.classList;
            sList.contains(expand) ? sList.remove(expand) : false;
          });
        });
      });
    });
  }

  toggleArchive(titles);

  (function currentYear() {
    let date = new Date();
    let year = date.getFullYear();
    $el('#year').innerHTML = '2009-' + year;
  })();

  (function toggleMenu() {
    let trigger = $el('.nav__toggle');
    let nav = $els('.nav')[0];
    let nClass = nav.classList;
    let open = 'nav__open';
    let xIcon = 'fa-bars';
    let yIcon = 'fa-times';
    trigger.addEventListener('click', function() {
      let icon = this.children[0];
      let iClass = icon.classList;
      nClass.contains(open) ? nClass.remove(open) : nClass.add(open);
      if(iClass.contains(xIcon)) {
        iClass.add(yIcon);
        iClass.remove(xIcon);
      }else if (iClass.contains(yIcon)){
        iClass.add(xIcon);
        iClass.remove(yIcon);
      }
    })
  })();

  (function loadSVGFont(){
      var font = document.createElement('link'); 
      font.type = 'text/css'; 
      font.rel = 'stylesheet';
      font.href = '/assets/svg-icons.css';
      var s = document.getElementsByTagName('link')[0]; 
      s.parentNode.insertBefore(font, s);
  })();
  
})();
