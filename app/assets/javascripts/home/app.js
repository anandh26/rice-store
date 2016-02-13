

$(function() {
  $('.show-search-bar-home').on('click', function(e) {
    e.preventDefault();
    $('.search-bar').toggle()
  });

  $(".owl-carousel.content-slider-with-controls-autoplay").owlCarousel({
    singleItem: !0,
    autoPlay: 5e3,
    navigation: !0,
    pagination: !0
  })

  $(".owl-carousel.carousel-autoplay").owlCarousel({
    autoPlay: 5e3,
    pagination: !1,
    navigation: !0,
    navigationText: !1
  })

  $("#contact-form").length > 0 && $("#contact-form").validate({
    submitHandler: function(o)
    {
      var name = $("#contact-form #name-from-user").val();
      if (name == undefined)
        name = $("#contact-form #name").val();
      var email = $("#contact-form #email-from-user").val();
      if (email == undefined)
        email = $("#contact-form #email-from-user").val();

      $(".submit-button").button("loading"),
          $.ajax({
          type: "POST",
          url: "/contact-us",
          data: { contact: {
            name: name,
            email: email,
            subject: $("#contact-form #subject").val(),
            message: $("#contact-form #message").val()
            }
          },
        dataType: "json",
        success: function(o) {
          "true" == o.sent ? ($("#MessageSent").removeClass("hidden"), $("#MessageNotSent").addClass("hidden"),
              $(".submit-button").removeClass("btn-default").addClass("btn-success").prop("value", "Message Sent"),
              $("#contact-form .form-control").each(function() {
              $(this).prop("value", "").parent().removeClass("has-success").removeClass("has-error")
          })) : ($("#MessageNotSent").removeClass("hidden"), $("#MessageSent").addClass("hidden"))
        }
      })
    },
    errorPlacement: function(e, o) {
      e.insertBefore(o)
    },
    onkeyup: !1,
    onclick: !1,
    rules: {
      name: {
        required: !0,
        minlength: 2
      },
      email: {
        required: !0,
        email: !0
      },
      subject: {
        required: !0
      },
      message: {
        required: !0,
        minlength: 10
      }
    },
    messages: {
      name: {
        required: "Please specify your name",
        minlength: "Your name must be longer than 2 characters"
      },
      email: {
        required: "We need your email address to contact you",
        email: "Please enter a valid email address e.g. name@domain.com"
      },
      subject: {
        required: "Please enter a subject"
      },
      message: {
        required: "Please enter a message",
        minlength: "Your message must be longer than 10 characters"
      }
    },
    errorElement: "span",
    highlight: function(o) {
      $(o).parent().removeClass("has-success").addClass("has-error"), $(o).siblings("label").addClass("hide")
    },
    success: function(o) {
      $(o).parent().removeClass("has-error").addClass("has-success"), $(o).siblings("label").removeClass("hide")
    }
  })

  $(".add-cart-prp").length > 0 && $(".add-cart-prp").validate({
    submitHandler: function(o)
    {
      AddToCart();
    },
    errorPlacement: function(e, o) {
      e.insertBefore(o)
    }
  });

  function AddToCart(){
    console.log($("#product_id").val());
    console.log($("#quantity").val())
  }

  $(".btn-remove").click(function() {
    $(this).closest(".remove-data").remove();
    $.ajax({
      type: "POST",
      url: "/remove-cart",
      data: {
        id:  $(this).closest('tr').attr('id')
      },
      dataType: "json",
      success: function(o) {
        if (o.done == 'true'){
        }
      }
    })
  });


});

