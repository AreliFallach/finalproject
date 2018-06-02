(function ($) {

  if (!$) {
    console.log('Need to load jquery');
    return;
  }

  $(function () {

    /**
     *
     * @type {{login: boolean, signup: boolean}}
     */
    var formDisplay = {
      login: true,
      signup: false
    };

    function setCurrentFormClass(){
      document.querySelector('.form').classList.toggle('signup',formDisplay.signup);
      document.querySelector('.form').classList.toggle('login',formDisplay.login);
    }

    setCurrentFormClass();

    $('.message a').click(function () {
      formDisplay.login  = !formDisplay.login;
      formDisplay.signup = !formDisplay.signup;
      setCurrentFormClass();
      $('form').animate({height: "toggle", opacity: "toggle"}, "slow");

    });

  });

})(jQuery);