var active = 1;

var quiz = {
  user: "Uma",
  questions: [
  {
    text: "What is the full form of HTTP?",
    responses: [
    { text: "Hyper text transfer package" },
    { text: "Hyper text transfer protocol", correct: true },
    { text: "Hyphenation text test program" },
    { text: "None of the above" }] },


  {
    text: "HTML document start and end with which tag pairs?",
    responses: [
    { text: "HTML", correct: true },
    { text: "WEB" },
    { text: "HEAD" },
    { text: "BODY" }] },


  {
    text: "Which tag is used to create body text in HTML?",
    responses: [
    { text: "HEAD" },
    { text: "BODY", correct: true },
    { text: "TITLE" },
    { text: "TEXT" }] },


  {
    text: "Outlook Express is _________",
    responses: [
    { text: "E-Mail Client", correct: true },
    { text: "Browser" },
    {
      text: "Search Engine" },

    { text: "None of the above" }] },


  {
    text: "What is a search engine?",
    responses: [
    { text: "A hardware component " },
    {
      text: "A machinery engine that search data" },

    { text: "A web site that searches anything", correct: true },
    { text: "A program that searches engines" }] },


  {
    text:
    "What does the .com domain represents?",
    responses: [
    { text: "Network" },
    { text: "Education" },
    { text: "Commercial", correct: true },
    { text: "None of the above" }] },


  {
    text: "In Satellite based communication, VSAT stands for? ",
    responses: [
    { text: " Very Small Aperture Terminal", correct: true },
    { text: "Varying Size Aperture Terminal " },
    {
      text: "Very Small Analog Terminal" },

    { text: "None of the above" }] },


  {
    text: "What is the full form of TCP/IP? ",
    responses: [
    { text: "Telephone call protocol / international protocol" },
    { text: "Transmission control protocol / internet protocol", correct: true },
    { text: "Transport control protocol / internet protocol " },
    { text: "None of the above" }] },


  {
    text:
    "What is the full form of HTML?",
    responses: [
    {
      text: "Hyper text marking language" },

    { text: "Hyphenation text markup language " },
    { text: "Hyper text markup language", correct: true },
    { text: "Hyphenation test marking language" }] },


  {
    text: "\"Yahoo\", \"Infoseek\" and \"Lycos\" are _________?",
    responses: [
    { text: "Browsers " },
    { text: "Search Engines", correct: true },
    { text: "News Group" },
    { text: "None of the above" }] }] },




userResponseSkelaton = Array(quiz.questions.length).fill(null);

var app = new Vue({
  el: "#app",
  data: {
    quiz: quiz,
    questionIndex: 0,
    userResponses: userResponseSkelaton,
    isActive: false },

  filters: {
    charIndex: function (i) {
      return String.fromCharCode(97 + i);
    } },

  methods: {
    
    selectOption: function (index) {
      Vue.set(this.userResponses, this.questionIndex, index);
      //console.log(this.userResponses);
    },
    next: function () {
      if (this.questionIndex < this.quiz.questions.length)
      this.questionIndex++;
    },

    prev: function () {
      if (this.quiz.questions.length > 0) this.questionIndex--;
    },
    // Return "true" count in userResponses
    score: function () {
      active = 0;
      var score = 0;
      for (let i = 0; i < this.userResponses.length; i++) {
        if (
        typeof this.quiz.questions[i].responses[
        this.userResponses[i]] !==
        "undefined" &&
        this.quiz.questions[i].responses[this.userResponses[i]].correct)
        {
          score = score + 1;
        }
      }
      return score;

      //return this.userResponses.filter(function(val) { return val }).length;
    } ,
    stopTimer: function()
    {
    
        document.getElementById("timer").innerHTML =  "--h "
          + "--m --s";
      
    }
  } });


    	// Set the date we're counting down to
	var countDownDate = new Date().getTime()+(10*60*1000);
  
  
	// Update the count down every 1 second
	var x = setInterval(function() {

        // Get today's date and time
        var now = new Date().getTime();
      
        // Find the distance between now and the count down date
        var distance = countDownDate - now;
      
        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
      
        // Output the result in an element with id="timer"
        document.getElementById("timer").innerHTML = hours + "h "
        + minutes + "m " + seconds + "s ";
      
        // If the count down is over, write some text
        if (distance < 0) {
        clearInterval(x);
        document.getElementById("timer").innerHTML = "EXPIRED";
        }
      
  }, 1000);
  
