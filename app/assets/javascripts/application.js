const footer = document.querySelector('.footer');

  if (footer) {
    window.addEventListener('scroll', () => {
      console.log("scrollY " + window.scrollY);
      console.log("inner " + window.innerHeight);
      console.log(document.body.scrollHeight);
      const height = (document.body.scrollHeight - 100);
      console.log(height);
      if (window.scrollY + window.innerHeight >= height ) {
        footer.style.visibility = "visible";
      } else {
        footer.style.visibility = "hidden";
      }
    });
  }
