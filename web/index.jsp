main
  // generates the navbar three times
  // each with different version classes
  // version-1, version-2 & version-3
  - for (let i=0; i<3; i++)
    header(class="version-" + (i+1))
      .logo
        i.fas.fa-feather-alt
      nav
        ul.nav
          li 
            a(href="#") 
              i.far.fa-chart-bar
              | Dashboard
          li 
            a(href="#") 
              i.far.fa-edit
              | Projects
          li 
            a(href="#") 
              i.far.fa-envelope-open
              | Posts
      a.user(href="#") 
        i.far.fa-user
        | Jane Doe